//
//  CalculatorViewModel.swift
//  August24b
//
//  Created by Ronnie Kissos on 9/10/23.
//

import Foundation

class CalculatorViewModel {

    public var isFinishedTyping = true
    private var firstOperand: Double? = nil
    public var operatorSymbol: String? = nil

    var displayValue: Double = 0 {
        didSet {
            displayValueChanged?(String(displayValue))
        }
    }

    var displayValueChanged: ((String) -> Void)?

    private var isLastInputDecimal = false

    func inputNumber(_ numValue: String) {
        if isFinishedTyping {
            displayValue = Double(numValue) ?? 0
            isFinishedTyping = false
        } else {
            // If a decimal point was just entered
            if numValue == "." {
                if String(displayValue).contains(".") {
                    return
                }
                isLastInputDecimal = true
            }

            if isLastInputDecimal {
                let roundedValue = floor(displayValue)
                displayValue = Double("\(roundedValue).\(numValue)") ?? 0
                isLastInputDecimal = false
            } else {
                displayValue = Double("\(displayValue)\(numValue)") ?? 0
            }
        }
    }


    func setOperator(_ symbol: String) {
        firstOperand = displayValue
        operatorSymbol = symbol
        isFinishedTyping = true
    }

    func calculate() {
        if let firstOperand = firstOperand, let operatorSymbol = operatorSymbol {
            switch operatorSymbol {
            case "+":
                displayValue = firstOperand + displayValue
            case "-":
                displayValue = firstOperand - displayValue
            case "x":
                displayValue = firstOperand * displayValue
            case "/":
                if displayValue == 0 {
                    return
                }
                displayValue = firstOperand / displayValue
            default:
                break
            }
        }
        resetCalculation()
    }

    func resetCalculation() {
        firstOperand = nil
        operatorSymbol = nil
        isFinishedTyping = true
    }

    func applyPercent() {
        displayValue = displayValue / 100
    }

    func toggleSign() {
        displayValue *= -1
    }

}
