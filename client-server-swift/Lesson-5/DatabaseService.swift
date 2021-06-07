//
//  DatabaseService.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 07.06.2021.
//

import Foundation
import RealmSwift

@objcMembers
class UserModel: Object {
    dynamic var name = ""
    dynamic var age = 0
    dynamic var gender = true
    dynamic var pet = ""
    dynamic var cat = ""
}

protocol DatabaseService {
    func save(user: UserModel)
    func readUsers() -> [UserModel]
    func deleteUser(user: UserModel)
}

class DatabaseServiceImpl: DatabaseService {
    
    let config = Realm.Configuration(schemaVersion: 1)
    lazy var mainRealm = try! Realm(configuration: config)

    func save(user: UserModel) {
        
        try! mainRealm.write{
            mainRealm.add(user)
        }
    }
    
    func readUsers() -> [UserModel] {
        
        let models = mainRealm.objects(UserModel.self)
        return Array(models)
    }
    
    func deleteUser(user: UserModel) {
        
        try! mainRealm.write{
            mainRealm.delete(user)
        }
    }
    
    
}
