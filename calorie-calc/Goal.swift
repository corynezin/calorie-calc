//
//  Meal.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 11/10/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit
import os.log


class Goal: NSObject, NSCoding {
    
    //MARK: Properties
    
    var weeklyAmount: Int
    var dailyAmount: Int
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("goals")
    
    //MARK: Types
    
    struct PropertyKey {
        static let weeklyAmount = "weeklyAmount"
        static let dailyAmount = "dailyAmount"
    }
    
    //MARK: Initialization
    
    init?(weeklyAmount: Int, dailyAmount: Int) {
        
        // Goal values must be positive
        guard weeklyAmount > 0 && dailyAmount > 0 else {
            return nil
        }
        
        // Initialize stored properties.
        self.weeklyAmount = weeklyAmount
        self.dailyAmount = dailyAmount
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(weeklyAmount, forKey: PropertyKey.weeklyAmount)
        aCoder.encode(dailyAmount, forKey: PropertyKey.dailyAmount)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let dailyAmount = aDecoder.decodeInteger(forKey: PropertyKey.dailyAmount)
        let weeklyAmount = aDecoder.decodeInteger(forKey: PropertyKey.weeklyAmount)
        
        // Must call designated initializer.
        self.init(weeklyAmount: weeklyAmount, dailyAmount: dailyAmount)
        
    }
}
