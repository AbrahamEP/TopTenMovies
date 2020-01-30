//
//  MovieDetailViewModel.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

struct MovieDetailViewModel {
    var title: String
    var releaseDate: String
    var rating: Double
    var overview: String
    var imageFrontUrl: URL?
    var imageBackUrl: URL?
    
    init(movie: Movie) {
        self.title = movie.title
        self.releaseDate = movie.releaseDate
        self.rating = movie.voteAverage
        self.overview = movie.overview
        self.imageFrontUrl = movie.posterImageFullPath
        self.imageBackUrl = movie.backdropImageFullPath
    }
}
