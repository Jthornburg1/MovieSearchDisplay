//
//  MovieCellViewModel.swift
//  MovieBrowser
//
//  Created by jonathan thornburg on 3/12/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieCellViewModel {
    
    let titleText: String
    let dateText: String
    let voteAverageText: String
    
    init(movie: Movie) {
        self.titleText = movie.title
        self.dateText = Date.spelledMonthString(from: movie.releaseDate)
        self.voteAverageText = "\(movie.votingAverage)"
    }
}
