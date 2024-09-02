//
//  File.swift
//  
//
//  Created by Gagandeep on 29/08/24.
//

import Foundation

final class NetworkFactory: INetworkFactory {
    
    public func service() -> INetworkService {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        config.timeoutIntervalForResource = 10.0
        let session = URLSession(configuration: config)
        return NetworkService(session: session)
    }
}
