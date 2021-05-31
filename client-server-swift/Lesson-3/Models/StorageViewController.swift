//
//  StorageViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 31.05.2021.
//

import UIKit
import SwiftKeychainWrapper
import RealmSwift

class Person: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var birthday: Date = Date()
    @objc dynamic var gender: Bool = false
}

class StorageViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //useUserDefaults()
        
        //useKeychain()
        
        //useCoreData()
        
        useRealm()
    }
    
    //Прочекать - onboarding, form
    func useUserDefaults() {
        
        let isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
        
        UserDefaults.standard.setValue(true, forKey: "isRegistered")
        
        print("isRegistered =", isRegistered)
    }
    
    //User-sensitive data
    //Ресерч - Сохранение по ключу
    func useKeychain() {
        
        let vkToken = KeychainWrapper.standard.string(forKey: "com.appname.vkToken")
        
        KeychainWrapper.standard.set("qwerty123456asdfg67890", forKey: "com.appname.vkToken")
        
        print("token = ", vkToken)
        
    }
    
    func useCoreData() {
        
        let application = UIApplication.shared.delegate as! AppDelegate
        
        let context = application.persistentContainer.viewContext
        
        let human = Human(context: context)
        human.age = 25
        
        let date: Date? = Date()
        human.birthday = date
        human.gender = false
        human.name = "Vasya"
        
        application.saveContext()
        
        guard let results = try? context.fetch(Human.fetchRequest()) as? [Human]
        else { return }
        
        guard let human = results.first else { return }
        
        print("human name =", human.name)
        
    }
    
    func useRealm() {
        
        let person = Person()
        
        person.name = "Alexa"
        person.gender = true
        person.birthday = Date()
        
        let realm = try! Realm()
        
        try? realm.write {
            realm.add([person])
        }
        
        loadPerson()
    }
    
    func loadPerson() {
        
        do {
            let realm = try Realm()
            let persons = realm.objects(Person.self)
            
            print(persons.map { $0.name })
            
        } catch {
            print(error)
        }
    }
}
