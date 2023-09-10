//
//  LoginViewModel.swift
//  RBSNews
//
//  Created by Ronnie Kissos on 9/9/23.
//

import Foundation

// This class defines the view model for the login process in the app.
// It manages the data, business logic, and rules for authentication.
class LoginViewModel {

    // Variables to store the entered username and password.
    var username: String = ""
    var password: String = ""

    // Expected username and password for a successful login.
    // In a real-world app, this will likely come from a secure storage or authentication server.
    let expectedUsername = "rbs"
    let expectedPassword = "1234"

    // Method that checks if both the entered username and password match the expected values.
    // Returns `true` if both are correct, otherwise returns `false`.
    func isValidCredentials() -> Bool {
        return username == expectedUsername && password == expectedPassword
    }

    // Method that checks if the entered username matches the expected value.
    // Returns `true` if it matches, otherwise returns `false`.
    func isValidUsername() -> Bool {
        return username == expectedUsername
    }
    
    // Method that checks if the entered password matches the expected value.
    // Returns `true` if it matches, otherwise returns `false`.
    func isValidPassword() -> Bool {
        return password == expectedPassword
    }
}
