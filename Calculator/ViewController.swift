//
//  ViewController.swift
//  Calculator
//
//  Created by Ray Shih on 4/16/15.
//  Copyright (c) 2015 Ray Shih. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingNumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber {
            enter()
        }
        
        switch operation {
        case "×": // mult
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() * operandStack.removeLast()
            }
//        case "÷": // divi
//        case "+": // plus
//        case "−": // minu
        default: break
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

