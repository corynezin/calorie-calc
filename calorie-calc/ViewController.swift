//
//  ViewController.swift
//  calorie-calc
//
//  Created by cnezin on 1/1/19.
//  Copyright © 2019 Debory. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var calorieCountInteger = 0
    var calorieList:[Int] = []
    var goals:[Goal] = [Goal(weeklyAmount: 11200, dailyAmount: 1600)!]
    @IBOutlet weak var historyPicker: UIPickerView!
    @IBOutlet weak var calorieCount: UILabel!
    @IBOutlet weak var calorieInput: UITextField!
    
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
    
    @IBAction func subtract(_ sender: Any) {
        if !calorieInput.text!.isEmpty {
            let calorieInputInt = Int(calorieInput.text!)
            calorieCountInteger -= calorieInputInt!
            calorieList.append(-calorieInputInt!)
            updateCalories()
        }
    }
    
    @IBAction func add(_ sender: Any) {
        if !calorieInput.text!.isEmpty {
            let calorieInputInt = Int(calorieInput.text!)
            calorieList.append(calorieInputInt!)
            calorieCountInteger += calorieInputInt!
            updateCalories()
        }
    }
    
    @IBAction func undo(_ sender: Any) {
        if !calorieList.isEmpty {
            let undoAmount = calorieList.popLast()
            calorieCountInteger -= undoAmount!
            updateCalories()
        }
    }
    
    func updateCalories() {
        self.historyPicker.reloadAllComponents()
        calorieInput.text = ""
        calorieCount.text = String(calorieCountInteger)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.historyPicker.delegate = self
        self.historyPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.calorieList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(self.calorieList[self.calorieList.count-1 - row])
    }
}

