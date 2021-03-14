//
//  NetworkingConstants.swift
//  MovieBrowser
//
//  Created by jonathan thornburg on 3/11/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

struct NetworkingConstants {
    
    static let apiKey = "cb0d6918d01f64392b500a719435eeb6"
    static let getMethod = "GET"
    static let baseUrlString  = "https://api.themoviedb.org/3/search/movie?api_key=\(NetworkingConstants.apiKey)&language=en-US&page=1&include_adult=false&query=%@"
    static let basePosterUrlString = "https://image.tmdb.org/t/p/original/"
    
}

