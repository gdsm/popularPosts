//
//  PopularPost.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import NetworkModule
import SwiftUI

final class PopularPost: Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var isFavorite: Bool
    var comments: [PostComments] = []
    
    init(userId: Int, id: Int, title: String, body: String, isFavorite: Bool = false) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        self.isFavorite = isFavorite
    }
    
    convenience init(post: Post) {
        self.init(userId: post.userId, id: post.id, title: post.title, body: post.body)
    }
}
