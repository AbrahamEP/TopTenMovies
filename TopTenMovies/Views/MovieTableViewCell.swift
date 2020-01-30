//
//  MovieTableViewCell.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movieInfo: MovieInfoCell! {
        didSet{
            self.setupInfo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func setupInfo() {
        self.textLabel?.text = self.movieInfo.title
        self.detailTextLabel?.text = self.movieInfo.releaseDate
    }
    
}
