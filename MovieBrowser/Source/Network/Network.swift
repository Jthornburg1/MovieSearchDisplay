//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class Network {
    let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    
    static func fetch(from queryString: String, completion: @escaping ([Movie], Error?) -> Void) {
        
        guard let encodedQuery = queryString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let urlString = String(format: NetworkingConstants.baseUrlString, encodedQuery)
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = NetworkingConstants.getMethod
        
        URLSession.shared.dataTask(with: request) { data, _, networkError in
            
            guard let data = data, networkError == nil else {
                completion([], networkError)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let batch = try decoder.decode(MovieBatch.self, from: data)
                completion(batch.results, nil)
            } catch {
                completion([], error)
            }
        }.resume()
    }
    
    static func fetchPosterImage(path: String, completion: @escaping (UIImage?, Error?) -> Void) {
        
        let fullPath = (NetworkingConstants.basePosterUrlString + path)
        
        guard let url = URL(string: fullPath) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = NetworkingConstants.getMethod
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, let image = UIImage(data: data), error == nil else {
                completion(nil, error)
                return
            }
            
            DispatchQueue.main.async {
                completion(image, nil)
            }
        }.resume()
    }
    
}


