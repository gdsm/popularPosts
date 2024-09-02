//
//  DatabaseFactory.swift
//  DatabaseModule
//
//  Created by Gagandeep on 02/09/24.
//

import Foundation
import RealmSwift

final internal class RealmDatabaseConnection {
    static let shared = RealmDatabaseConnection()
    private var realm: Realm!
    
    private func save<T: Object>(entity: T) throws {
        try realm.write {
            realm.add(entity)
        }
    }
}

extension RealmDatabaseConnection: IDatabaseInitialisation {
    func initialize() throws {
        realm = try Realm()
    }
}

extension RealmDatabaseConnection: IPostsCrud {
    
    private func get(entity: IPostsEntity) -> some RealmPosts {
        let result = RealmPosts()
        result.userId = entity.userId
        result.id = entity.id
        result.title = entity.title
        result.body = entity.body
        result.isFavorite = entity.isFavorite
        return result
    }
    
    func create(entity: IPostsEntity) throws {
        try save(entity: get(entity: entity))
    }
    
    func read(id: Int) -> IPostsEntity? {
        let predicate = NSPredicate(format: "id = %@", id)
        return realm.objects(RealmPosts.self).filter(predicate).first
    }
    
    func update(id: Int, entity: IBaseEntity) throws {
        guard let entity = read(id: id) else {
            print("no such entity found with id: \(id)")
            return
        }
        let value = get(entity: entity)
        value.userId = entity.userId
        value.id = entity.id
        value.title = entity.title
        value.body = entity.body
        value.isFavorite = entity.isFavorite
        try save(entity: get(entity: entity))
    }

    func delete(id: Int) {
        guard let entity = read(id: id) else {
            print("no such entity found with id: \(id)")
            return
        }
        realm.delete(get(entity: entity))
    }
}
