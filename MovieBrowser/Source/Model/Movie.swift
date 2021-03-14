//
//  Movie.swift
//  MovieBrowser
//
//  Created by jonathan thornburg on 3/12/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let overview: String
    var posterPath: String?
    let releaseDate: String
    let title: String
    let votingAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case votingAverage = "vote_average"
    }
        
}
