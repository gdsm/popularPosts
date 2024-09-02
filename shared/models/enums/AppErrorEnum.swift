//
//  AppErrorEnum.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import Foundation
import NetworkModule

enum AppErrorEnum: Error {
    case unknown
    case invalidParams
    case networkError(nwError: NetworkError)
}
