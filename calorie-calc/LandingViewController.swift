//
//  LandingViewController.swift
//  calorie-calc
//
//  Created by cnezin on 1/1/19.
//  Copyright © 2019 Debory. All rights reserved.
//

import UIKit
import os.log

class LandingViewController: UIViewController {
    

    func isAppAlreadyLaunchedOnce()->Bool{
        let defaults = UserDefaults.standard
        
        if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
            print("App already launched : \(isAppAlreadyLaunchedOnce)")
            return true
        }else{
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var goals:[Goal]
        goals = []
    }
    
}

