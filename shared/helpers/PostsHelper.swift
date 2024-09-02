//
//  PostsHelper.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import DatabaseModule
import Foundation
import NetworkModule
import RxSwift

final class PostsHelper: IPostsHelper {

    private let nwService: INetworkService
    let posts = BehaviorSubject<[PopularPost]>(value: [])
    
    init(nwFactory: INetworkFactory = NetworkModule.getFactory()) {
        self.nwService = nwFactory.service()
    }

    func getPosts() {
        Task { [weak self] in
            guard let self = self else {
                return
            }
            
            let endPoint = EndPointFactory.post()
            let result : Result<Posts, NetworkError> = await self.nwService.getResponse(request: endPoint.getEndPoint())

            /// TODO: Update the resutl in Database.
            switch result {
            case .success(let posts):
                print("fetched posts \(posts.count)")
                var popularPosts: [PopularPost] = []
                for post in posts {
                    let popPost = PopularPost(post: post)
                    DatabaseProvider.getPostCrud().create(entity: popPost)
                    popularPosts.append(popPost)
                }
                self.posts.onNext(popularPosts)
            case .failure( _):
                print("Failed to read entities from network. Reading locally.")
                DatabaseProvider.getPostCrud().readAll { values in
                    self.posts.onNext(values.map { PopularPost(post: $0) })
                }
//                self.posts.onError(AppErrorEnum.networkError(nwError: error))
            }
        }
    }

    func markFavorite(post: PopularPost) {
        Task { [weak self] in
            guard let self = self else {
                return
            }
            guard let allPosts = try? self.posts.value(),
                  let selectedPost = allPosts.first(where: { $0.id == post.id }) else {
                self.posts.onError(AppErrorEnum.unknown)
                return
            }
            selectedPost.isFavorite = true
            DatabaseProvider.getPostCrud().update(entity: selectedPost)
            self.posts.onNext(allPosts)
        }
    }
}
