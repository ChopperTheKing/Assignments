//
//  RBSNewsUITests.swift
//  RBSNewsUITests
//
//  RBS Tests Project on 12/10/20.
//

import XCTest

class RBSNewsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false //makes sure tests stop after first failure
    }

    override func tearDownWithError() throws {
    }

    
    func testLoginUI() {
        
        let app = XCUIApplication()
        app.launch()
        
        let titleLabel = app.navigationBars["Login screen"].staticTexts["Login screen"] //verifies if the title label ("Login screen") exists on the navigation bar.
        
        XCTAssertTrue(titleLabel.exists)
        
        let userNameTF = app.textFields["Enter username"] //Checks the existence of a username text field with a placeholder "Enter username".
        
        XCTAssertTrue(userNameTF.exists)

       let passwordTf =  app.secureTextFields["Enter password"] //Checks the existence of a password text field with a placeholder "Enter password".
        
        XCTAssertTrue(passwordTf.exists)

       let button = app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ //Verifies that the "Login" button or label exists.
        
        XCTAssertTrue(button.exists)
                
    }
   
    
    func testLoginButton_failure() {
        
        let app = XCUIApplication()
        app.launch()
        let userTextFiled = app.textFields["Enter username"]
        userTextFiled.tap()
        userTextFiled.typeText("rbs") //enters "rbs" as the username.
        
        let passwordTf = app.secureTextFields["Enter password"]
        
        passwordTf.tap()
        passwordTf.typeText("asdfa") //Enters an incorrect password "asdfa".
        
        app.staticTexts["Login"].tap() //Taps the "Login" button.
        
        let elementsQuery = app.alerts["Alert!"].scrollViews.otherElements
        
        let alertMessage = elementsQuery.staticTexts["Alert!"] //Checks the appearance of an alert with the title "Alert!".
        
        XCTAssertTrue(alertMessage.exists) //Verifies the presence of a message "Password is invalid" in the alert.
        
        let messageLbl = elementsQuery.staticTexts["Password is invalid"]
        XCTAssertTrue(messageLbl.exists)
        

        elementsQuery.buttons["Ok"].tap() //taps the "Ok" button to dismiss the alert.
        
    }
    
    func testLoginButton_success() {
        let app = XCUIApplication()
        app.launch()
        let userTextFiled = app.textFields["Enter username"]
        userTextFiled.tap()
        userTextFiled.typeText("rbs") //Enters "rbs" as the username.
        
        let passwordTf = app.secureTextFields["Enter password"]
        
        passwordTf.tap()
        passwordTf.typeText("1234") ////Enters the correct password "1234".
        
        app.staticTexts["Login"].tap() //Taps the "Login" button.
        
    
        let newsTitle = app.navigationBars["News screen"].staticTexts["News screen"]
        XCTAssertTrue(newsTitle.exists) //verifies if the user is navigated to the news screen by checking the existence of the title "News screen" on the navigation bar.

        
    }
   
}
