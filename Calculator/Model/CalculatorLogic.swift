//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Sagar Baloch on 30/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (firstNumber: Double, operation: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String)->Double?{
        
        if let n = number{
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n/100
            case "=":
                return performTwoNumCalculation(secondNumber: n)
            default:
                intermediateCalculation = (firstNumber: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(secondNumber n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.firstNumber,
            let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "/":
                return n1 / n2
            case "x":
                return n1 * n2
            default:
                print("")
            }
        }
        return nil
        
    }
}

