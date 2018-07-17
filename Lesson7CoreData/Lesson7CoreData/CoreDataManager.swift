//
//  CoreDataManager.swift
//  Lesson7CoreData
//
//  Created by Can Khac Nguyen on 7/17/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Person{
    var id : Int!
    var name :  String!
    var age : Int!
    
    init() {
        id = -1
        name = " "
        age = 0
    }
    
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}
class CoreDataManager{
    static let shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer : NSPersistentContainer = {
       let container = NSPersistentContainer(name: "PersonData")
//        container.loadPersistentStores(completionHandler: { (stored, error) in
//            if let err = error as NSError?{
//                fatalError("Error when load persistent container \(err)")
//            }
//        })
//        return container
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer
    }()
    
    func saveContext(){
        let context = CoreDataManager.shared.persistentContainer.viewContext
        do{
            try context.save()
        }catch{
            if let err = error as NSError?{
                fatalError("Error when save context \(err)")
            }
        }
    }
    
    func insertPersonTo(table: String, person: Person) -> Bool{
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: table, in: context)
        let manager = NSManagedObject(entity: entity!, insertInto: context)
        manager.setValue(person.id, forKey: "id")
        manager.setValue(person.name, forKey: "name")
        manager.setValue(person.age, forKey: "age")
        
        do{
            try context.save()
            return true
        }catch{
            return false
        }
    }
    
    func showAll(table: String) -> [PersonData]?{
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: table)
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(request)
            for result in results{
                print(result)
            }
            return results as? [PersonData]
        }catch{
            return nil
        }
    }
    
    func deletePerson(table: String, _id: Int){
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: table)
        request.predicate = NSPredicate(format: "id == %d", _id)
        do{
            let item = try context.fetch(request)
            for i in item{
                context.delete(i as! NSManagedObject)
                try context.save()
            }
            return
        }catch{
            return
        }
    }
}
