//
//  File.swift
//  
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

public protocol INetworkService {
    func getResponse<T: Codable>(request: String) async -> Result<T, NetworkError>
    func getResponse<T: Codable>(request: URLRequest) async -> Result<T, NetworkError>
}
