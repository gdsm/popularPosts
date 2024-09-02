//
//  RealmPosts.swift
//  DatabaseModule
//
//  Created by Gagandeep on 02/09/24.
//

import Foundation
import RealmSwift

class RealmPosts: Object, IPostsEntity {
    @objc dynamic var userId: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    @objc dynamic var isFavorite: Bool = false
}
