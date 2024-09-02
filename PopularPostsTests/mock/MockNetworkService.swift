//
//  IMockNetworkService.swift
//  PopularPostsTests
//
//  Created by Gagandeep on 02/09/24.
//

import NetworkModule
import Foundation

class MockNetworkService<S: Codable>: INetworkService {
    private let response: Result<S, NetworkError>
    
    init(response: Result<S, NetworkError>) {
        self.response = response
    }
    
    func getResponse<T>(request: String) async -> Result<T, NetworkError> where T: Codable {
        return response as! Result<T, NetworkError>
    }
    
    func getResponse<T>(request: URLRequest) async -> Result<T, NetworkError> where T : Codable {
        return response as! Result<T, NetworkError>
    }
}
