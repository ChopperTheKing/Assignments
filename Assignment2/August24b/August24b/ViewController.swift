//
//  ViewController.swift
//  August24b
//
//  Created by Ronnie Kissos on 8/24/23.
//

import UIKit

class ViewController: UIViewController {

    private var isFinishedTyping = true
    private var firstOperand: Double? = nil
    private var operatorSymbol: String? = nil
    private var displayValue: Double {
        get {
            guard let number = Double(outputBox.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            outputBox.text = String(newValue)
        }
    }
    
    @IBOutlet weak var outputBox: UITextView!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var ACButton: UIButton!
    @IBOutlet weak var plusOrMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBAction func zeroButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "0"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "0"
        }
    }
    @IBAction func oneButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "1"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "1"
        }
    }
    @IBAction func twoButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "2"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "2"
        }
    }
    @IBAction func threeButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "3"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "3"
        }
    }
    @IBAction func fourButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "4"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "4"
        }
    }
    @IBAction func fiveButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "5"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "5"
        }
    }
    @IBAction func sixButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "6"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "6"
        }
    }
    @IBAction func sevenButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "7"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "7"
        }
    }
    @IBAction func eightButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "8"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "8"
        }
    }
    @IBAction func nineButton(_ sender: Any) {
        if isFinishedTyping {
            outputBox.text = "0"
            isFinishedTyping = false
        } else {
            outputBox.text = outputBox.text! + "9"
        }
    }
    @IBAction func plusButton(_ sender: Any) {
        firstOperand = displayValue
        operatorSymbol = "+"
        isFinishedTyping = true
    }
    @IBAction func minusButton(_ sender: Any) {
        firstOperand = displayValue
        operatorSymbol = "-"
        isFinishedTyping = true
    }
    @IBAction func multiplyButton(_ sender: Any) {
        firstOperand = displayValue
        operatorSymbol = "x"
        isFinishedTyping = true
    }
    @IBAction func divideButton(_ sender: Any) {
        firstOperand = displayValue
        operatorSymbol = "/"
        isFinishedTyping = true
    }
    @IBAction func percentButton(_ sender: Any) {
        displayValue = displayValue / 100
    }
    @IBAction func equalButton(_ sender: Any) {
        if let firstOperand = firstOperand, let operatorSymbol = operatorSymbol {
            if operatorSymbol == "+" {
                displayValue = firstOperand + displayValue
            }
            else if operatorSymbol == "-" {
                displayValue = firstOperand - displayValue
            }
            else if operatorSymbol == "x" {
                displayValue = firstOperand * displayValue
            }
            else if operatorSymbol == "/" {
                displayValue = firstOperand / displayValue
            }
            
        }
        self.firstOperand = nil
        operatorSymbol = nil
        isFinishedTyping = true
    }
    
    @IBAction func ACButton(_ sender: Any) {
        if (sender as AnyObject).currentTitle == "AC" {
            firstOperand = nil
            operatorSymbol = nil
        }
        displayValue = 0
        isFinishedTyping = true
    }
    @IBAction func plusOrMinusButton(_ sender: Any) {
        displayValue *= -1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func showError(_ message: String) {
          let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default))
          self.present(alert, animated: true)
      }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                outputBox.text = numValue
                isFinishedTyping = false
            } else {
                if numValue == "." && (outputBox.text?.contains(".") ?? false) {
                    return
                }
                outputBox.text = outputBox.text! + numValue
            }
        }
    }
    
}

