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
    var backdropPath: String
    var id: Int
    var title: String
    var voteAverage: Double
    var overview: String
    var releaseDate: String
    var originalLanguage: String
    var originalTitle: String
    var genreIds: [Int]
//    enum CodingKeys: String, CodingKey {
//        case id, title, popularity, overview
//        case voteCount = "vote_count"
//        case posterPath = "poster_path"
//        case voteAverage = "vote_average"
//        case releaseDate = "release_Date"
//        case hasVideo = "video"
//        case isAdult = "adult"
//        case backdropPath = "backdrop_path"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//    }
}
