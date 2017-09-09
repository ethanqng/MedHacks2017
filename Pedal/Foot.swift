//
//  Foot.swift
//  UITestProject
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import Foundation
import RealmSwift

class Foot: Object{
    
    dynamic var pulse: Pulse?
    dynamic var highSense = Data()
    dynamic var lowSense = Data()
    dynamic var palm = Data()
    dynamic var ankle = Data()
    dynamic var standing = Data()
    dynamic var side = false
    
    convenience init(side:Bool, pulse:Pulse, palm: Data, ankle:Data, standing:Data, highSense:Data, lowSense:Data){
        
        self.init()
        self.pulse = pulse
        self.highSense = highSense
        self.lowSense = lowSense
        self.palm = palm
        self.ankle = ankle
        self.standing = standing
        self.side = side
        
    }
    
    func itemByCategory(category:Category) -> (UIImage, UIImage?){
        switch category {
        case .ankle:
            return (self.ankle.toPicture()!, nil)
        case .palm:
            return (self.palm.toPicture()!, nil)
        case .standing:
            return (self.standing.toPicture()!, nil)
        case .sensitivity:
            return (self.highSense.toPicture()!, self.lowSense.toPicture())
        default:
            return (self.ankle.toPicture()!, self.ankle.toPicture())
        }
    }
    
}
enum Category:String {
    case sensitivity = "Sensitivity"
    case pulse = "Pulse"
    case palm = "Palm"
    case ankle = "Ankle"
    case standing = "Standing"
}
