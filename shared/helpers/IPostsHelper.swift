//
//  IPostsHelper.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import Foundation
import NetworkModule
import RxSwift

protocol IPostsHelper {
    
    var posts: BehaviorSubject<[PopularPost]> { get }
    
    /// Method returns popular posts
    /// - Returns: List of popular posts.
    func getPosts()

    /// Mark the post as favorite
    /// - Parameter post: Selected Post
    func markFavorite(post: PopularPost)
}
