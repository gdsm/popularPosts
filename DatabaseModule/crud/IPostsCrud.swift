//
//  IDatabaseCRUD.swift
//  DatabaseModule
//
//  Created by Gagandeep on 02/09/24.
//

import Foundation

public protocol IPostsCrud {
    func create(entity: IPostsEntity)
    func read(id: Int, completion: @escaping (IPostsEntity?) -> Void)
    func readAll(completion: @escaping ([IPostsEntity]) -> Void)
    func update(entity: IPostsEntity)
    func delete(id: Int)
}
