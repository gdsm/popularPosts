//
//  LoginHelper.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation
import NetworkModule
import RxSwift

final class LoginHelper: ILoginHelper {
    
    private let nwService: INetworkService
    
    init(nwFactory: INetworkFactory = NetworkModule.getFactory()) {
        self.nwService = nwFactory.service()
    }
    
    func createUser(email: String, password: String) -> Observable<UserModel> {
        // Simulate a network request
        return Observable.create { observer in
            let task = Task { [weak self] in
                guard let self = self else {
                    // Class instance is dellocated. So nothing can be thrown on observer.
                    return
                }
                let endPoint = EndPointFactory.createUser(contract: LoginContract(email: email, password: password))

                let result : Result<UserModel, NetworkError> = await self.nwService.getResponse(request: endPoint.getEndPoint())
                // Currently ignoring result for login api. Login api is dummy api only.
                
                /// TODO: Second step is to save in DB.
                observer.onNext(UserModel(email: email, name: email))
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func login(email: String, password: String) -> Observable<UserModel> {
        // Simulate a network request
        return Observable.create { observer in
            let task = Task { [weak self] in
                guard let self = self else {
                    // Class instance is dellocated. So nothing can be thrown on observer.
                    return
                }
                let endPoint = EndPointFactory.login(contract: LoginContract(email: email, password: password))
                
                let result : Result<UserModel, NetworkError> = await self.nwService.getResponse(request: endPoint.getEndPoint())
                // Currently ignoring result for login api. Login api is dummy api only.
                
                /// TODO: Second step is to save in DB.
                observer.onNext(UserModel(email: email, name: email))
            }
            return Disposables.create {
                task.cancel()
            }
        }

//        return Observable.just(UserModel(email: email, name: email))
//            .delay(.seconds(2), scheduler: SerialDispatchQueueScheduler(qos: .default))
    }
}
