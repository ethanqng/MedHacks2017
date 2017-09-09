//
//  Pulse.swift
//  UITestProject
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import Foundation
import RealmSwift

class Pulse: Object {
    dynamic var felt = false
    dynamic var beats = 0
    dynamic var strength = 0
    
    convenience init(felt:Bool, beats:Int, strength: Int){
        self.init()
        self.felt = felt
        self.beats = beats
        self.strength = strength
    }
}
