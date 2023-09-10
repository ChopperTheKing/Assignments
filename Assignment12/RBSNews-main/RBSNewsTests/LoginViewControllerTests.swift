//
//  LoginViewControllerTests.swift
//  RBSNewsTests
//
//  Created by MAC on 01/12/21.
//

import XCTest
@testable import RBSNews

class LoginViewModelTests: XCTestCase {

    var viewModel: LoginViewModel!

    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel() //a new instance of LoginViewModel is created and assigned to the viewModel property.
    }

    func testValidCredentials() {
        viewModel.username = "rbs"
        viewModel.password = "1234" //sets the UN and PW properties of the viewModel to known valid values.
        XCTAssertTrue(viewModel.isValidCredentials()) //checks if the method isValidCredentials() on the viewModel returns true
    }

    func testInvalidUsername() {
        viewModel.username = "wrongUsername"
        viewModel.password = "1234" //Sets the UN property to an incorrect value and PW to a known valid value.
        XCTAssertFalse(viewModel.isValidCredentials()) //Checks if the method isValidCredentials() on the viewModel returns false
        XCTAssertFalse(viewModel.isValidUsername()) //checks if the method isValidUsername() on the viewModel returns false, indicating that the username is invalid.
    }

    func testInvalidPassword() {
        viewModel.username = "rbs"
        viewModel.password = "wrongPassword" //Sets the UN property to a known valid value and the PW to an incorrect value.
        XCTAssertFalse(viewModel.isValidCredentials()) //Checks if the method isValidCredentials() on the viewModel returns false.
        XCTAssertFalse(viewModel.isValidPassword()) //checks if the isValidPassword() on the viewModel returns false, indicating that the password specifically is invalid.
    }
}
