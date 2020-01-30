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
    
    //MARK: - Variables
    var moviesPagination: Pagination<Movie>! = Pagination<Movie>()
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }
    
    //MARK: - Helper
    private func setup() {
        self.setupTableView()
        API.shared.getMovies { [weak self] (movies, errorMessage) in
            guard let self = self else {return}
            guard let movies = movies else {
                
                return
            }
            self.moviesPagination = movies
            self.moviesTableView.reloadData()
        }
    }
    
    private func setupTableView() {
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        self.moviesTableView.rowHeight = 80
        self.moviesTableView.separatorStyle = .none
    }
    
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let currentMovie = self.moviesPagination.results[indexPath.row]
        let cellInfo = MovieInfoCell(movie: currentMovie)
        cell.movieInfo = cellInfo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moviesPagination.results.count
    }
    
}
