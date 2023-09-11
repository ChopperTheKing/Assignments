//
//  ViewController.swift
//  August24b
//
//  Created by Ronnie Kissos on 8/24/23.
//

import UIKit

class ViewController: UIViewController {

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

    private var viewModel = CalculatorViewModel() //Declare an instance of CalculatorViewModel in ViewController:

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.displayValueChanged = { [weak self] value in
            self?.outputBox.text = value //whenever the displayValue in CalculatorViewModel changes, the closure gets called, and the outputBox's text gets updated, binding the ViewModel's logic to update the ViewController's UI.
        }
        oneButton.setTitle("1", for: .normal)
        twoButton.setTitle("2", for: .normal)
        threeButton.setTitle("3", for: .normal)
        fourButton.setTitle("4", for: .normal)
        fiveButton.setTitle("5", for: .normal)
        sixButton.setTitle("6", for: .normal)
        sevenButton.setTitle("7", for: .normal)
        eightButton.setTitle("8", for: .normal)
        nineButton.setTitle("9", for: .normal)
        zeroButton.setTitle("0", for: .normal)
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.title(for: .normal) {
            //print("Button title: \(numValue)")
            viewModel.inputNumber(numValue)
        } else {
            //print("Button does not have a title.")
        }
    }



    @IBAction func plusButton(_ sender: Any) {
        viewModel.setOperator("+")
    }

    @IBAction func minusButton(_ sender: Any) {
        viewModel.setOperator("-")
    }

    @IBAction func multiplyButton(_ sender: Any) {
        viewModel.setOperator("x")
    }

    @IBAction func divideButton(_ sender: Any) {
        viewModel.setOperator("/")
    }

    @IBAction func percentButton(_ sender: Any) {
        viewModel.applyPercent()
    }

    @IBAction func equalButton(_ sender: Any) {
        viewModel.calculate()
    }

    @IBAction func ACButton(_ sender: Any) {
        viewModel.resetCalculation()
        viewModel.displayValue = 0
    }

    @IBAction func plusOrMinusButton(_ sender: Any) {
        viewModel.toggleSign()
    }
}
