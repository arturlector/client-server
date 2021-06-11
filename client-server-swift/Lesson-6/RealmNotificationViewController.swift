//
//  RealmNotificationViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 11.06.2021.
//

import UIKit
import RealmSwift

@objcMembers
class Pet: Object {
    dynamic var name = ""
    dynamic var gender = false
    dynamic var age = 0
    
}

class RealmNotificationViewController: UIViewController {

    lazy var mainRealm = try! Realm()
    
    var token: NotificationToken?
    
    var pets: Results<Pet>? {
        didSet {
            token = pets?.observe { changes in
                
                switch changes {
                case .initial(let results):
                    print("Start to modified", results)
                    //Pattern matching - Enum
                case .update(let results, let deletions, let insertions, let modifications):
                    print("Pets modified", results)
                    
                case .error(let error):
                    print("error", error.localizedDescription)
                    
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        notifyPets()
        addPets()
    }
    
    func addPets() {
        
        let pet1 = Pet()
        pet1.name = "Fiji"
        pet1.age = 3
        
        let pet2 = Pet()
        pet2.name = "Lucky"
        pet2.age = 5
        
        let pet3 = Pet()
        pet3.name = "Om"
        pet3.age = 7
        
        try? mainRealm.write{
            mainRealm.add([pet1, pet2, pet3])
        }
        
        print(mainRealm.configuration.fileURL as Any)
    }
    
    func notifyPets() {
        
        pets = mainRealm.objects(Pet.self)
            .filter("age > 3")
            .sorted(byKeyPath: "name")
        
    }

}
