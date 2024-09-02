//
//  File.swift
//  
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

public final class EndPointFactory {
    
    public static func login(contract: LoginContract) -> LoginEndPoint {
        return LoginEndPoint(
            endPoint: .prod(baseUrl: "https://prod.jsonplaceholder.typicode.com/login"),
            contract: contract
        )
    }
    
    public static func createUser(contract: LoginContract) -> CreateUserEndPoint {
        return CreateUserEndPoint(
            endPoint: .prod(baseUrl: "https://prod.jsonplaceholder.typicode.com/createUser"),
            contract: contract
        )
    }
    
    public static func post() -> PostsEndPoint {
        return PostsEndPoint(
            endPoint: .prod(baseUrl: "https://jsonplaceholder.typicode.com")
        )
    }
}
