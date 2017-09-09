//
//  Checkup.swift
//  UITestProject
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import Foundation
import RealmSwift

class Checkup: Object{
    dynamic var date = Date()
    dynamic var left: Foot? //= Foot()
    dynamic var right: Foot? //= Foot()
    dynamic var sent = false
    
    
    convenience init(left:Foot, right:Foot, date:Date, sent:Bool){
        self.init()
        self.left = left
        self.right = right
        self.date = date
        self.sent = sent
    }
    
    
    
}
