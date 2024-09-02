//
//  LoginViewModel.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import Combine
import NetworkModule
import SwiftUI
import RxCocoa
import RxSwift

final class LoginViewModel: ObservableObject {
    
    let email = BehaviorSubject<String>(value: "")
    let password = BehaviorSubject<String>(value: "")

    let isLoginEnabled: Observable<Bool>
//    let loginResult: Observable<Result<UserModel, LoginService.LoginError>>
    private let disposeBag = DisposeBag()
//    private let scheduler = SerialDispatchQueueScheduler(qos: .default)
    private let loginHelper: ILoginHelper
    
    init(
        loginHelper: ILoginHelper = LoginHelper()
    ) {
        self.loginHelper = loginHelper
        isLoginEnabled = Observable.combineLatest(email, password) { StringUtility.isValidEmail($0) && StringUtility.isValidPassword($1) }
            .share(replay: 1, scope: .whileConnected)
    }
    
    func login(isNewUser: Bool) -> Observable<Result<UserModel, AppErrorEnum>> {
        return Observable.combineLatest(email, password)
            .flatMapLatest { [unowned self] email, password in
                if isNewUser {
                    return self.loginHelper.createUser(email: email, password: password)
                        .materialize()
                } else {
                    return self.loginHelper.login(email: email, password: password)
                        .materialize()
                }
            }
            .flatMap { event -> Observable<Result<UserModel, AppErrorEnum>> in
                switch event {
                case .next(let success):
                    return .just(.success(success))
                case .error(let error):
                    return .just(.failure(.unknown))
                case .completed:
                    return .empty()
                }
            }
    }
}
