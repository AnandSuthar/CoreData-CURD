//
//  CD.swift
//  CoreDataExample
//
//  Created by SunarcMAC on 08/05/17.
//  Copyright © 2017 SunarcMAC. All rights reserved.
//

import CoreData
import UIKit


extension NSManagedObject {
    
    
    convenience init(entityName: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        self.init(entity: NSEntityDescription.entity(forEntityName: entityName, in:context)!, insertInto: context)
    }
    
    
    
    
    func save() {
        do {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    class func delete(withPredicate predicate: NSPredicate?) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let request: NSFetchRequest<NSFetchRequestResult> = self.fetchRequest()
        request.predicate = predicate
        
        var result = [NSManagedObject]()
        
        do {
            result = try context.fetch(request) as! [NSManagedObject]
            for object in result {
                context.delete(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    class func get(withPredicate predicate: NSPredicate?) -> [NSManagedObject] {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let request: NSFetchRequest<NSFetchRequestResult> = self.fetchRequest()
        request.predicate = predicate
        
        var result = [NSManagedObject]()
        
        do {
            result = try context.fetch(request) as! [NSManagedObject]
            return result
        } catch {
            print(error.localizedDescription)
        }
        
        return result
        
    }
    
    class func context() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

