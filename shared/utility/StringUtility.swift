//
//  StringUtility.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

final class StringUtility {
    
    static func isValidEmail(_ value: String) -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,6}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: value)
    }
    
    static func isValidPassword(_ value: String) -> Bool {
        return (value.count >= 8 && value.count <= 15)
//        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>]).{8,15}$"
//        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
//        return passwordPred.evaluate(with: value)
    }
}
