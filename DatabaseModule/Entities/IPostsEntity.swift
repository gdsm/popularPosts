//
//  Posts.swift
//  DatabaseModule
//
//  Created by Gagandeep on 02/09/24.
//

import Foundation

public protocol IPostsEntity: IBaseEntity {
    var userId: Int { get }
    var id: Int { get }
    var title: String { get }
    var body: String { get }
    var isFavorite: Bool { get }
}
