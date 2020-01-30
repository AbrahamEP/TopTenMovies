//
//  MovieListViewController.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit
import MBProgressHUD

class MovieListViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var moviesTableView: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(refresh:)), for: UIControl.Event.valueChanged)
        
        return refreshControl
    }()
    
    //MARK: - Variables
    var movies: [Movie]! = []
    var selectedMovie: Movie!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupMovies()
    }
    
    //MARK: - Helper
    private func setup() {
        self.setupTableView()
        self.title = "Top Ten Movies"
    }
    
    private func setupMovies() {
        guard let savedMovies = MoviesHelper.getSavedMovies() else {
            //Request movies because it is the first time
            self.getMovies()
            
            return
        }
        //there's saved movies
        //Check if is over 24 hours
        guard MoviesHelper.isDateOver24Hours() else {
            //Do not request the movies again, just set the saved movies
            
            self.movies = savedMovies
            self.moviesTableView.reloadData()
            return
        }
        //Is over 24 hours, request the movies again
        self.getMovies()
    }
    
    private func getMovies(completion: (() -> Void)? = nil) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        API.shared.getMovies { [weak self] (movies, errorMessage) in
            guard let self = self else {return}
            MBProgressHUD.hide(for: self.view, animated: true)
            guard let movies = movies else {
                //An error ocurred. Show it to the user
                if let completion = completion {
                    completion()
                }
                if let errorMessage = errorMessage {
                    self.showAlertOneButtonWith(alertTitle: errorMessage, alertMessage: nil, buttonTitle: "Aceptar")
                }else {
                    self.showAlertOneButtonWith(alertTitle: "Ocurrió un error", alertMessage: nil, buttonTitle: "Aceptar")
                }
                return
            }
            
            self.movies = movies
            self.moviesTableView.reloadData()
            if let completion = completion {
                completion()
            }
        }
    }
    
    private func setupTableView() {
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        self.moviesTableView.rowHeight = 80
        self.moviesTableView.separatorStyle = .singleLine
        self.moviesTableView.separatorInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        self.moviesTableView.refreshControl = self.refreshControl
    }
    
    //MARK: - Actions
    @objc func handleRefresh(refresh: UIRefreshControl) {
        self.getMovies {
            refresh.endRefreshing()
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            guard let detailVC = segue.destination as? MovieDetailViewController else {return}
            detailVC.movieInfo = MovieDetailViewModel(movie: self.selectedMovie)
        }
    }
    
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let currentMovie = self.movies[indexPath.row]
        let cellInfo = MovieInfoCell(movie: currentMovie)
        cell.movieInfo = cellInfo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.selectedMovie = self.movies[indexPath.row]
        self.performSegue(withIdentifier: "toDetailSegue", sender: self)
    }
    
}
