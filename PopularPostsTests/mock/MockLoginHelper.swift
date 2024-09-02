//
//  MockLoginHelper.swift
//  PopularPostsTests
//
//  Created by Gagandeep on 02/09/24.
//

@testable import PopularPosts
import NetworkModule
import RxSwift
import Foundation

class MockLoginHelper: ILoginHelper {
    func createUser(email: String, password: String) -> Observable<UserModel> {
        return Observable.just(UserModel(email: email, name: email))
            .delay(.seconds(1), scheduler: SerialDispatchQueueScheduler(qos: .default))
    }
    
    func login(email: String, password: String) -> Observable<UserModel> {
        return Observable.just(UserModel(email: email, name: email))
            .delay(.seconds(1), scheduler: SerialDispatchQueueScheduler(qos: .default))
    }
}
