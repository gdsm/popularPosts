//
//  File.swift
//  
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

public struct UserModel: Codable {
    let email: String
    let name: String?
    
    public init(email: String, name: String?) {
        self.email = email
        self.name = name
    }
}
