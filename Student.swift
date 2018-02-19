//
//  Student+CoreDataClass.swift
//  CoreData2
//
//  Created by SunarcMAC on 19/02/18.
//  Copyright © 2018 SunarcMAC. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Student)
public class Student: NSManagedObject {
    @NSManaged public var name: String?
    
}

extension Student {
    
    convenience init?(json: [String: Any]?) {
        guard let json = json else { return nil }
        self.init(entityName: "Student")
        
        self.name = json["name"] as? String
    }
    
}

