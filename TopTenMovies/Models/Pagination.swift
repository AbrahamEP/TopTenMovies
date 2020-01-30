//
//  Pagination.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

struct PaginationModel: Codable {
    var count: Int = 0
    var next: String?
    var previous: String?
    
    init() {}
}

struct Pagination<T: Codable>: Codable {
    var results: [T]
    var totalResults: Int = 0
    var totalPages: Int = 1
    var page: Int = 1
    
    
    init() {
        results = []
    }
    
//    enum CodingKeys: String, CodingKey {
//        case results, page
//        case totalResults = "total_results"
//        case totalPages = "total_pages"
//    }
}
