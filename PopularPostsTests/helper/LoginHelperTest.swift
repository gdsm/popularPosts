//
//  LoginHelperTest.swift
//  PopularPostsTests
//
//  Created by Gagandeep on 02/09/24.
//

@testable import PopularPosts
@testable import NetworkModule
import RxSwift
import XCTest

final class LoginHelperTest: XCTestCase {
        
    private let disposeBag = DisposeBag()
    
    func testLoginFailure() {
        let expectation = XCTestExpectation(description: "Testing login helper")
        let helper = LoginHelper(nwService: MockNetworkService<UserModel>(response: .failure(.application)))
        helper.login(email: "some@gmail.com", password: "1234567")
            .subscribe(onNext: { value in
                XCTFail("Expecting failure")
            }, onError: { error in
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testLoginSuccess() {
        let expectation = XCTestExpectation(description: "Testing login helper")
        let helper = LoginHelper(nwService: MockNetworkService<UserModel>(response: .success(UserModel(email: "some@gmail.com", name: "Some"))))
        helper.login(email: "some@gmail.com", password: "1234567")
            .subscribe(onNext: { value in
                XCTAssertEqual(value.email, "some@gmail.com")
                expectation.fulfill()
            }, onError: { error in
                XCTFail("Expecting failure")
            })
            .disposed(by: disposeBag)
        
        wait(for: [expectation], timeout: 2.0)
    }}
