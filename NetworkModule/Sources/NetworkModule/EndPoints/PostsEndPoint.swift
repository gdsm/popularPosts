//
//  File.swift
//  
//
//  Created by Gagandeep on 29/08/24.
//

import Foundation

public struct PostsEndPoint {
    let endPoint: EndPoint
    
    public func getEndPoint() -> String {
        return endPoint.getBaseUrl() + "/posts"
    }
}
