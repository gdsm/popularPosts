//
//  LoginContract.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

public struct LoginContract: Codable {
    let email: String
    let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
