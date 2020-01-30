//
//  SaveTopMovies.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

struct MoviesHelper {
    
    
    static func saveMovies(_ movies: [Movie]) {
        do {
            let moviesData = try JSONEncoder().encode(movies)
            UserDefaults.standard.set(moviesData, forKey: "movies")
        } catch {
            print("Error al guardar movies")
        }
    }
    
    static func getSavedMovies() -> [Movie]? {
        guard let data = UserDefaults.standard.data(forKey: "movies") else {
            return nil
        }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch {
            return nil
        }
    }
    
    static func getLastDate() -> Date? {
        return UserDefaults.standard.object(forKey: "lastDate") as? Date
    }
    
    static func saveLastDate(_ date: Date) {
        UserDefaults.standard.set(date, forKey: "lastDate")
    }
    
    static func isDateOver24Hours() -> Bool {
        guard let lastDate = MoviesHelper.getLastDate() else {
            return false
        }
        guard let diff = Calendar.current.dateComponents([.hour], from: lastDate, to: Date()).hour else {
            return false
        }
        return diff > 24
    }
}
