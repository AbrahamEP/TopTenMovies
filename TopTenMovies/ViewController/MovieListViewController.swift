//
//  MovieListViewController.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var moviesTableView: UITableView!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }
    
    //MARK: - Helper
    private func setup() {
        
    }
    
}
