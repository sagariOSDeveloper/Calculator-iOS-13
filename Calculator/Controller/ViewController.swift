//
//  ViewController.swift
//  Calculator
//
//  Created by Sagar Baloch on 24/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var DisplayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double{
        get{
            guard let number = Double(DisplayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set{
            DisplayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            guard let result = calculator.calculate(symbol: calcMethod) else{
                fatalError("Cannot calculte value")
            }
            displayValue = result
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            
            if isFinishedTypingNumber {
                DisplayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                
                if numValue == "."{
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                }
                DisplayLabel.text? = DisplayLabel.text! + numValue
            }
        }
    }
    
}

