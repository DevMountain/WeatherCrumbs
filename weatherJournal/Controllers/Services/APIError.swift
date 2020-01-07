//
//  APIError.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/20/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case unableToDecode(Error)
    case noDataFound
    case dataTaskError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Could not contact the server."
        case .unableToDecode(let error):
            return error.localizedDescription
        case .noDataFound:
            return "The server responded with no data."
        case .dataTaskError(let error):
            return error.localizedDescription
        }
    }
}
