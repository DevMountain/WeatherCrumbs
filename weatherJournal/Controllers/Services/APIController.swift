//
//  APIController.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct APIController {
    static func fetchData(for url: URL, completion: @escaping (Result<Data, APIError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.dataTaskError(error)))
            }
            guard let data = data else {
                completion(.failure(.noDataFound))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
