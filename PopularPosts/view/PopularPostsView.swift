//
//  PopularPostsView.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import SwiftUI

struct PopularPostsView: View {

    @StateObject private var postViewModel = PostsViewModel()
    @Binding var navigationPath: NavigationPath

    var body: some View {
        TabView {
            PostsView(navigationPath: $navigationPath)
                .environmentObject(postViewModel)
                .tabItem {
                    Image(systemName: "newspaper.circle.fill")
                }

            FavoritePostsView(navigationPath: $navigationPath)
                .environmentObject(postViewModel)
                .tabItem {
                    Image(systemName: "star.circle.fill")
                }
        }
        .navigationTitle(LocalizedStrings.appTitle)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PopularPostsView(
        navigationPath: .constant(NavigationPath())
    )
}
