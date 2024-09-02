//
//  FavoritePostsView.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import SwiftUI

struct FavoritePostsView: View {

    @EnvironmentObject private var postViewModel: PostsViewModel
    @Binding var navigationPath: NavigationPath
    @State private var popularPosts: [PopularPost] = []

    var body: some View {
        VStack {
            List {
                ForEach($popularPosts) { $post in
                    NavigationLink(
                        destination: PostDetailView(post: post)
                            .environmentObject(postViewModel)
                    ) {
                        PostRow(post: $post)
                    }
                }
            }
            .onAppear {
                connectListener()
            }
        }
    }
    
    private func connectListener() {
        postViewModel.favoritePosts.subscribe { value in
            popularPosts = value
        }
        .disposed(by: postViewModel.disposeBag)
    }
}

#Preview {
    FavoritePostsView(
        navigationPath: .constant(NavigationPath())
    )
}
