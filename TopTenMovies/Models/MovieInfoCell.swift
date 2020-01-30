//
//  MovieInfoCell.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation
struct MovieInfoCell {
    var imageURL: URL?
    var title: String
    var releaseDate: String
    
    init(movie: Movie) {
        self.imageURL = movie.posterImageFullPath
        self.title = movie.title
        self.releaseDate = movie.releaseDate
    }
}
