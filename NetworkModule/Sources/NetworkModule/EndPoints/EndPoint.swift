//
//  File.swift
//  
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

enum EndPoint {
    case qa(baseUrl: String)
    case prod(baseUrl: String)
    
    func getBaseUrl() -> String {
        switch self {
        case .prod(let url):
            return url
        case .qa(let url):
            return url
        }
    }
}
