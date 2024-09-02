//
//  StringUtilityTest.swift
//  PopularPostsTests
//
//  Created by Gagandeep on 02/09/24.
//

@testable import PopularPosts
import XCTest

final class StringUtilityTest: XCTestCase {
    
    func testIsValidEmail() {
        XCTAssertTrue(StringUtility.isValidEmail("some@gmail.com"))
        XCTAssertTrue(StringUtility.isValidEmail("a@a.com"))
        XCTAssertFalse(StringUtility.isValidEmail("a"))
    }
    
    func testIsValidPassword() {
        XCTAssertTrue(StringUtility.isValidPassword("12345678"))
        XCTAssertFalse(StringUtility.isValidEmail("1234567"))
        XCTAssertFalse(StringUtility.isValidEmail("1-2-3-4-5-6-7-8-9-10-11-12-13"))
    }
}
