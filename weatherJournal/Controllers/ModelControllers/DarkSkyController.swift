//
//  DarkSkyService.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct DarkSkyController {
    
    static func fetchWeatherInfo(for route: DarkSkyRoute, completion: @escaping (Result<Weather, APIError>) -> Void) {
        
        guard let url = route.finalURL else {
            completion(.failure(.invalidURL))
            return
        }
        
        APIController.fetchData(for: url) { (result) in
            do {
                let foundData = try result.get()
                let decoder = JSONDecoder()
                let weather = try decoder.decode(Weather.self, from: foundData)
                completion(.success(weather))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.unableToDecode(error)))
            }
        }
    }
}
