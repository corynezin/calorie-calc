//
//  ViewController.swift
//  calorie-calc
//
//  Created by cnezin on 1/1/19.
//  Copyright © 2019 Debory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calorieCountInteger = 0
    
    @IBOutlet weak var calorieCount: UILabel!
    @IBOutlet weak var calorieInput: UITextField!
    
    @IBAction func subtract(_ sender: Any) {
        if !calorieInput.text!.isEmpty {
            let calorieInputInt = Int(calorieInput.text!)
            calorieCountInteger -= calorieInputInt!
            updateCalories()
        }
    }
    
    @IBAction func add(_ sender: Any) {
        if !calorieInput.text!.isEmpty {
            let calorieInputInt = Int(calorieInput.text!)
            calorieCountInteger += calorieInputInt!
            updateCalories()
        }
    }
    
    func updateCalories() {
        calorieInput.text = ""
        calorieCount.text = String(calorieCountInteger)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Cory was here
        // Cheers to making new years resolutions!
        // And one more
        // another one
        // Do any additional setup after loading the view, typically from a nib.
    }

}

