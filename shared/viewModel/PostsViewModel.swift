//
//  PostsViewModel.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import RxSwift
import NetworkModule
import SwiftUI
import RxRelay

final class PostsViewModel: ObservableObject {
    
    private let postsHelper: IPostsHelper
    let popularPosts: Observable<[PopularPost]>
    let favoritePosts: Observable<[PopularPost]>
    let disposeBag = DisposeBag()

    init(postsHelper: IPostsHelper = PostsHelper()) {
        self.postsHelper = postsHelper
        
        popularPosts = postsHelper.posts.asObservable()
        favoritePosts = popularPosts.map { posts in
            posts.filter { $0.isFavorite }
        }
        
        postsHelper.getPosts()
    }
    
    func markFavorite(post: PopularPost) {
        postsHelper.markFavorite(post: post)
    }
}
