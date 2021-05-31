//
//  Human+CoreDataProperties.swift
//  
//
//  Created by Artur Igberdin on 31.05.2021.
//
//

import Foundation
import CoreData


extension Human {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Human> {
        return NSFetchRequest<Human>(entityName: "Human")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var gender: Bool

}
