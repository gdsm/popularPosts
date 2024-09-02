//
//  File.swift
//  
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

public enum NetworkError: Error {
    case unknown
    case invalidUrl
    case invalidResponse
    case invalidJson
    case application
    case http(status: Int)
}
