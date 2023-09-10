//
//  ViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit

class LoginViewController: UIViewController { //LoginViewController is a subclass of UIViewController.
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    var viewModel: LoginViewModel = LoginViewModel() // An instance of the LoginViewModel class that will handle the business logic related to user login.

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login screen" //title for the navigation bar is set to "Login screen".
        usernameTextField.becomeFirstResponder() //the user can immediately start typing their username.

    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        viewModel.username = usernameTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? "" //user's input for username and password are assigned to the viewModel's respective properties.

        guard !viewModel.username.isEmpty && !viewModel.password.isEmpty else {
            Utility.shared.showAlert(self, "Alert!", "Please input credentials.") //checks if the username and password are not empty. If either or both are empty, it displays an alert message.
            return
        }

        if !viewModel.isValidUsername() {
            Utility.shared.showAlert(self, "Alert!", "Username is invalid") //f the username is invalid (as determined by the viewModel), it shows an alert message.
            return
        }

        if !viewModel.isValidPassword() {
            Utility.shared.showAlert(self, "Alert!", "Password is invalid") //if the password is invalid (as determined by the viewModel), it shows an alert message.
            return
        }

        navigateToHomeScreen()
    }
    
    func navigateToHomeScreen() {
        if let newsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsViewController") as? NewsViewController {
            if let navigation = navigationController {
                navigation.pushViewController(newsViewController, animated: true) //uses the UIStoryboard API to instantiate the NewsViewController from the "Main" storyboard and then pushes it onto the navigation controller's stack
            }
        }
    }
}
