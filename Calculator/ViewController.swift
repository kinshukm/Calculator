//
//  ViewController.swift
//  Calculator
//
//  Created by Kinshuk Mishra on 03/01/16.
//  Copyright © 2016 Sample Code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var display: UILabel!

    var userInTheMiddleOfTypingANumber = false
    
    @IBAction func appendDigit(_ sender: AnyObject) {
        let digit = sender.currentTitle!
        print(digit!)
        if userInTheMiddleOfTypingANumber {
            display.text = display.text! + digit!
        } else {
            display.text = digit!
            userInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle
        if userInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation! {
        case "×" :performOperation () {$0 * $1}
        case "÷" :performOperation () {$1 / $0}
        case "+" :performOperation () {$0 + $1}
        case "−" :performOperation () {$1 - $0}
        case "√" :performSingleOperation() {sqrt($0)}
//        case "C" :operandStack.removeAll()
        default: break
        }
    }
    
    func performOperation (_ operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
        displayValue = operation (operandStack.removeLast(), operandStack.removeLast())
        enter()
        }
        
    }
    
    func performSingleOperation (_ operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation (operandStack.removeLast())
            enter()
        }
        
    }
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    //function to convert string to double and viceversa
    
    var displayValue: Double {
        get {
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userInTheMiddleOfTypingANumber = false
        }
    }
}

