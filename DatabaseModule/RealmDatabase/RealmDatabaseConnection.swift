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
    private let queue = DispatchQueue(label: "RealmDatabaseConnection-Queue")
    private var realm: Realm!
    
    private init() {
        // Init not available due to privace protection.
    }
    
    private func save<T: Object>(entity: T) throws {
        perform {
            try self.realm.write {
                self.realm.add(entity)
            }
        }
    }
    
    private func perform(_ callback: @escaping () throws -> Void) {
        queue.async {
            try? callback()
        }
    }
}

extension RealmDatabaseConnection: IDatabaseInitialisation {
    func initialize() {
        perform {
            do {
                self.realm = try Realm(queue: self.queue)
            } catch {
                print("Exception in openning realm database.")
            }
        }
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
    
    private func read(id: Int) -> RealmPosts? {
        let predicate = NSPredicate(format: "id = %ld", id)
        return realm.objects(RealmPosts.self).filter(predicate).first
    }
    
    func create(entity: IPostsEntity) {
        perform {
            do {
                if let _ = self.read(id: entity.id) {
                    self.update(entity: entity)
                } else {
                    try self.save(entity: self.get(entity: entity))
                }
            } catch {
                print("Exception in creating new entity \(entity)")
            }
        }
    }

    func read(id: Int, completion: @escaping (IPostsEntity?) -> Void) {
        perform {
            completion(self.read(id: id))
        }
    }
    
    func readAll(completion: @escaping ([IPostsEntity]) -> Void) {
        perform {
            completion(self.realm.objects(RealmPosts.self).shuffled())
        }
    }

    func update(entity: IPostsEntity) {
        perform {
            guard let current = self.read(id: entity.id) else {
                print("no such entity found with id: \(entity.id)")
                return
            }
            do {
                try self.realm.write {
                    current.userId = entity.userId
                    current.id = entity.id
                    current.title = entity.title
                    current.body = entity.body
                    current.isFavorite = entity.isFavorite
                }
            } catch {
                print("Error in saving")
            }
        }
    }

    func delete(id: Int) {
        perform {
            guard let entity = self.read(id: id) else {
                print("no such entity found with id: \(id)")
                return
            }
            self.realm.delete(self.get(entity: entity))
        }
    }
}
