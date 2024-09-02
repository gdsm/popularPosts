//
//  File.swift
//  
//
//  Created by Gagandeep on 29/08/24.
//

import Foundation

/// Factory class to build and return NetworkService.
public protocol INetworkFactory {
        
    /// Method returns NetworkService
    /// - Parameters:
    ///   - requestTimeout: Request Timeout
    ///   - resourceTimeout: Timeout to accuire resource.
    /// - Returns: NetworkService.
    func service() -> INetworkService
}
