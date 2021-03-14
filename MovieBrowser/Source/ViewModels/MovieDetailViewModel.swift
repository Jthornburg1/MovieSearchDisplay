//
//  MovieDetailViewModel.swift
//  MovieBrowser
//
//  Created by jonathan thornburg on 3/12/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewModel {
    
    let convertibleDateString: String
    var image: UIImage {
        guard let placeholder = UIImage(named: "placeholder") else { return UIImage() }
        return placeholder
    }
    let overviewText: String
    lazy var releaseDateText: String = {
        return ""
    }()
    var titleText: String
    
    init(movie: Movie) {
        self.convertibleDateString = movie.releaseDate
        self.overviewText = movie.overview
        self.titleText = movie.title
    }
    
}
