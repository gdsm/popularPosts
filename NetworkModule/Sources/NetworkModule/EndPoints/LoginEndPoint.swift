//
//  File.swift
//  
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

public struct LoginEndPoint {
    let endPoint: EndPoint
    let contract: LoginContract
    
    public func getEndPoint() -> String {
        return endPoint.getBaseUrl() + "/login"
    }
}

public struct CreateUserEndPoint {
    let endPoint: EndPoint
    let contract: LoginContract
    
    public func getEndPoint() -> String {
        return endPoint.getBaseUrl() + "/createUser"
    }
}
