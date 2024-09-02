//
//  LoginViewModelTest.swift
//  PopularPostsTests
//
//  Created by Gagandeep on 02/09/24.
//

@testable import PopularPosts
import RxSwift
import XCTest

final class LoginViewModelTest: XCTestCase {
    
    private let disposeBag = DisposeBag()

    func testIsLoginEnable() {
        let expectation = XCTestExpectation(description: "Testing login helper")
        let viewModel = LoginViewModel(loginHelper: MockLoginHelper())
        viewModel.isLoginEnabled.subscribe(onNext: { value in
            XCTAssertTrue(value)
            expectation.fulfill()
        }, onError: { error in
            XCTFail("Expecting sucess.")
        }, onCompleted: {
            
        })
        .disposed(by: disposeBag)
        viewModel.email.onNext("some@gmail.com")
        viewModel.password.onNext("some@gmail.com")
    }
}
