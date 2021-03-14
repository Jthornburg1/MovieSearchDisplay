//
//  MovieDetailViewModel.swift
//  MovieBrowser
//
//  Created by jonathan thornburg on 3/12/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

protocol ImageUpdatable {
    func upDate(image: UIImage)
}

class MovieDetailViewModel {
    
    private struct Constants {
        static let releaseDatePrefix = "Release Date: "
    }
    
    var imageUpdatable: ImageUpdatable?
    let overviewText: String
    private let posterPath: String?
    let releaseDateText: String
    let titleText: String
    
    init(movie: Movie) {
        self.releaseDateText = Constants.releaseDatePrefix + Date.slashString(from: movie.releaseDate)
        self.overviewText = movie.overview
        self.posterPath = movie.posterPath
        self.titleText = movie.title
    }
    
    func fetchImage() {
        guard let path = posterPath else { return }
        Network.fetchPosterImage(path: path) { [weak self] image, error in
            guard let image = image, error == nil else { return }
            self?.imageUpdatable?.upDate(image: image)
        }
    }
    
}
