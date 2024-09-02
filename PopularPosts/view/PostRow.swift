//
//  PostRow.swift
//  PopularPosts
//
//  Created by Gagandeep on 29/08/24.
//

import SwiftUI

struct PostRow: View {
    @Binding var post: PopularPost

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
//            Button(action: {
//                post.isFavorite.toggle()
//            }) {
//                Image(systemName: post.isFavorite ? "star.fill" : "star")
//                    .foregroundColor(post.isFavorite ? .yellow : .gray)
//            }
//            .buttonStyle(BorderlessButtonStyle()) // Ensure button tap doesn't interfere with row selection
        }
        .padding()
    }
}

#Preview {
    PostRow(post: .constant(PopularPost(userId: 1, id: 1, title: "Drone show", body: "NY Time Square has its first Drone show in 2024."))
    )
}
