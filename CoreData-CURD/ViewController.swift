//
//  ViewController.swift
//  CoreData2
//
//  Created by SunarcMAC on 19/02/18.
//  Copyright © 2018 SunarcMAC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let student = Student(json: ["name" : "Anand"])
        student?.save()
        
        
        let allStudents = Student.get(withPredicate: nil) as! [Student]
        print(allStudents.count)
        
    }
    
    
    
}

