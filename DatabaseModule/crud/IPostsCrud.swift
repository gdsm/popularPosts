//
//  IDatabaseCRUD.swift
//  DatabaseModule
//
//  Created by Gagandeep on 02/09/24.
//

import Foundation

protocol IPostsCrud {
    func create(entity: IPostsEntity) throws
    func read(id: Int) -> IPostsEntity?
    func update(id: Int, entity: IBaseEntity) throws
    func delete(id: Int)
}
