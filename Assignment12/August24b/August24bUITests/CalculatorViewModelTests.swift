//
//  CalculatorViewModelTests.swift
//  August24bUITests
//
//  Created by Ronnie Kissos on 9/10/23.
//

import XCTest
@testable import August24b

class CalculatorViewModelTests: XCTestCase {

    var viewModel: CalculatorViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CalculatorViewModel()
    }

    func testInputNumber() { //Tests the behavior of inputting numbers and a decimal point into the calculator. It verifies that numbers are correctly appended and the decimal point behaves correctly.
        viewModel.inputNumber("3")
        XCTAssertEqual(viewModel.displayValue, 3)

        viewModel.inputNumber("5")
        XCTAssertEqual(viewModel.displayValue, 35)
        
        viewModel.inputNumber(".")
        XCTAssertEqual(viewModel.displayValue, 35)
        
        viewModel.inputNumber("1")
        XCTAssertEqual(viewModel.displayValue, 35.1)
    }

    func testSetOperatorAndCalculate() { //Tests the basic arithmetic operations (+, -, x, /). It sets up scenarios for each operation, performs the calculation, and checks if the resulting value matches the expected value.
        // Test addition
        viewModel.inputNumber("3")
        viewModel.setOperator("+")
        viewModel.inputNumber("2")
        viewModel.calculate()
        XCTAssertEqual(viewModel.displayValue, 5)

        // Test subtraction
        viewModel.inputNumber("10")
        viewModel.setOperator("-")
        viewModel.inputNumber("4")
        viewModel.calculate()
        XCTAssertEqual(viewModel.displayValue, 6)

        // Test multiplication
        viewModel.inputNumber("5")
        viewModel.setOperator("x")
        viewModel.inputNumber("4")
        viewModel.calculate()
        XCTAssertEqual(viewModel.displayValue, 20)

        // Test division
        viewModel.inputNumber("20")
        viewModel.setOperator("/")
        viewModel.inputNumber("5")
        viewModel.calculate()
        XCTAssertEqual(viewModel.displayValue, 4)
        
        // Test division by zero (assuming this sets the value to 0 or infinity)
        viewModel.inputNumber("1")
        viewModel.setOperator("/")
        viewModel.inputNumber("0")
        viewModel.calculate()
        XCTAssertTrue(viewModel.displayValue.isInfinite)
    }

    func testApplyPercent() { //Tests the percent operation on the calculator. It checks if the values are correctly converted into their respective percentages.
        viewModel.inputNumber("50")
        viewModel.applyPercent()
        XCTAssertEqual(viewModel.displayValue, 0.5)
        
        viewModel.inputNumber("200")
        viewModel.applyPercent()
        XCTAssertEqual(viewModel.displayValue, 2)
    }

    func testToggleSign() { //Tests the ability to change the sign of the current number (from positive to negative and vice versa).
        viewModel.inputNumber("5")
        viewModel.toggleSign()
        XCTAssertEqual(viewModel.displayValue, -5)

        viewModel.toggleSign()
        XCTAssertEqual(viewModel.displayValue, 5)
    }

    func testResetCalculation() { //Tests the resetting functionality of the calculator. It checks if all the values and states are reset to their initial state after this operation.
        viewModel.inputNumber("5")
        viewModel.setOperator("+")
        viewModel.resetCalculation()
        XCTAssertEqual(viewModel.displayValue, 0)
        XCTAssertNil(viewModel.operatorSymbol)
        XCTAssertTrue(viewModel.isFinishedTyping)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
}
