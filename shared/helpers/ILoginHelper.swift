//
//  ILoginHelper.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import Foundation
import NetworkModule
import RxSwift

protocol ILoginHelper {
    
    /// Method creates a new user account
    /// - Parameters:
    ///   - email: unique email address
    ///   - password: password
    /// - Returns: returns Rx Observable
    func createUser(email: String, password: String) -> Observable<UserModel>
    
    /// Method logs in user account
    /// - Parameters:
    ///   - email: unique email address
    ///   - password: password
    /// - Returns: returns Rx Observable
    func login(email: String, password: String) -> Observable<UserModel>
}
