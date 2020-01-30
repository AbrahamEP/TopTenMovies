//
//  Movie.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var popularity: Double
    var voteCount: Int
    var video: Bool
    var adult: Bool
    var posterPath: String
    var posterImageFullPath: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(self.posterPath)")
    }
    
    var backdropPath: String
    var backdropImageFullPath: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(self.backdropPath)")
    }
    
    var id: Int
    var title: String
    var voteAverage: Double
    var overview: String
    var releaseDate: String
    var originalLanguage: String
    var originalTitle: String
    var genreIds: [Int]
    
    
}
