//
//  PostDetailView.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import SwiftUI

struct PostDetailView: View {
    
    @EnvironmentObject private var postViewModel: PostsViewModel
    var post: PopularPost

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(post.title)
                .font(.largeTitle)
                .bold()
            Text(post.body)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationBarTitle("Post Details", displayMode: .inline)
        .onAppear {
            postViewModel.markFavorite(post: post)
        }
    }
}

#Preview {
    PostDetailView(
        post: PopularPost(userId: 1, id: 1, title: "Drone show", body: "NY Time Square has its first Drone show in 2024.")
    )
}
