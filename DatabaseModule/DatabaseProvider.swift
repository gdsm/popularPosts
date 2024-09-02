//
//  DatabaseService.swift
//  DatabaseModule
//
//  Created by Gagandeep on 02/09/24.
//

import Foundation

public class DatabaseProvider {
    public static func getDatabaseInitialiser() -> IDatabaseInitialisation {
        return RealmDatabaseConnection.shared
    }
    public static func getPostCrud() -> IPostsCrud {
        return RealmDatabaseConnection.shared
    }
}
