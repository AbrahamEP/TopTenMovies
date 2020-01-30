//
//  API.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation
class API {
    static let shared = API()
    private let session = URLSession.shared
    private let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=1a48730d4857aee7373a03e2c418c44f&page=1")!
    
    func getMovies(completion: @escaping (_ movies: [Movie]?, _ errorMessage: String?) -> Void) {
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    let errorMessage = "Ocurrió un error: " +
                    error.localizedDescription + "\n"
                    completion(nil, errorMessage)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    completion(nil, "Ha ocurrido un error. Intenta de nuevo más tarde")
                    return
                }
                
                guard let mime = httpResponse.mimeType, mime == "application/json" else {
                    completion(nil, "Ocurrió un error. Intenta de nuevo más tarde.")
                    return
                }
                guard let data = data else {
                    completion(nil, "Ocurrió un error. Intenta de nuevo más tarde.")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let movies = try decoder.decode(Pagination<Movie>.self, from: data)
                    
                    let firstTopTen = Array(movies.results.prefix(10))
                    
                    if MoviesHelper.getSavedMovies() == nil {
                        MoviesHelper.saveMovies(firstTopTen)
                        MoviesHelper.saveLastDate(Date())
                    }
                    
                    completion(firstTopTen, nil)
                } catch {
                    let err = error.localizedDescription
                    print(err)
                    completion(nil, "Ocurrió un error. Intenta de nuevo más tarde.")
                }
            }
        }
        
        task.resume()
    }
    
}
