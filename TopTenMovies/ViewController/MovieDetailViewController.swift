//
//  MovieDetailViewController.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit
import ImageSlideshow

class MovieDetailViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    //MARK: - Variables
    var movieInfo: MovieDetailViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }
    
    //MARK: - Helper Methods
    private func setup() {
        self.setupSlideShow()
        self.setupInfo()
    }
    
    private func setupSlideShow() {
        self.slideShow.circular = false
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.black
        pageIndicator.pageIndicatorTintColor = UIColor.lightGray
        self.slideShow.pageIndicator = pageIndicator
        self.slideShow.pageIndicatorPosition = PageIndicatorPosition(horizontal: .right(padding: 20), vertical: .bottom)
        self.slideShow.activityIndicator = DefaultActivityIndicator(style: .large, color: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImageSlideShow))
        self.slideShow.addGestureRecognizer(tapGesture)
    }
    
    private func setupInfo() {
        self.titleLabel.text = self.movieInfo.title
        self.dateLabel.text = self.movieInfo.releaseDate
        self.ratingLabel.text = "Rating: \(self.movieInfo.rating)"
        self.overviewLabel.text = self.movieInfo.overview
        guard let frontImageUrl = self.movieInfo.imageFrontUrl, let backImageUrl = self.movieInfo.imageBackUrl else {return}
        let images = [
            SDWebImageSource(url: frontImageUrl),
            SDWebImageSource(url: backImageUrl)
        ]
        self.slideShow.setImageInputs(images)
    }
    
    //MARK: - Actions
    @objc func didTapImageSlideShow() {
        self.slideShow.presentFullScreenController(from: self)
    }
}
