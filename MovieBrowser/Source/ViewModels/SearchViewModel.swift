//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by jonathan thornburg on 3/12/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    var movies: [Movie] = []
    
    func query(term: String, completion: @escaping () -> Void) {
        Network.fetch(from: term) { [weak self] movies, error in
            
            guard error == nil else {
                completion()
                return
            }
            
            self?.movies = movies
            completion()
        }
    }
    
}
