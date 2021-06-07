//
//  RealmViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 07.06.2021.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController {

    //lazy var realm = try! Realm(configuration: .defaultConfiguration)
    
    let databaseService = DatabaseServiceImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = UserModel()
        user.name = "Alexa"
        user.age = 25
        user.gender = true
        user.pet = "Lucky"
        user.cat = "Kitty"
        
        databaseService.save(user: user)
        
        print(databaseService.readUsers())
        
        databaseService.deleteUser(user: user)
        
        print(databaseService.readUsers())
        
        
        
        
        //Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        
//        let config = Realm.Configuration(schemaVersion: 2)
//        let realm = try! Realm(configuration: config)
//
//        let testUser = TestUser()
//        testUser.name = "Alexa"
//        testUser.age = 25
//        testUser.gender = true
//        testUser.pet = "Lucky"
//        testUser.cat = "Kitty"
//
//        do {
//            realm.beginWrite()
//            realm.add(testUser)
//            try realm.commitWrite()
//
//        } catch {
//            print(error)
//        }
//
//        print(realm.configuration.fileURL)

    }


}
