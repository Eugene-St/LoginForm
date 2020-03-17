//
//  ViewController.swift
//  LoginForm
//
//  Created by Eugene St on 06.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  // MARK: - IB Outlets
  @IBOutlet var usernameTextLabel: UITextField!
  @IBOutlet var passwordTextLabel: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.setGradientBackColor(colorone: .white, colorTwo: .systemBlue, colorThree: .black)
    usernameTextLabel.textColor = .black
    passwordTextLabel.textColor = .black
  }
  
  // MARK: - Private properties
  private let userInfo = UserInfo.getUserData()
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "HomeVC" {
      if let tabBarController = segue.destination as? UITabBarController {
        if let homeViewControllerVC = tabBarController.viewControllers?.first as? HomeViewController {
          homeViewControllerVC.userNameFromLoginScreen = userInfo.username
        }
      }
    }
  }
  
  // MARK: - IB Actions
  @IBAction func loginPressed() {
    if usernameTextLabel.text == "\(userInfo.username)" && passwordTextLabel.text == "\(userInfo.password)" {
      performSegue(withIdentifier: "HomeVC", sender: nil)
    } else {
      showAlert(with: "Invalid login or Password", and: "Please, enter correct login and password")
    }
  }
  
  @IBAction func forgotUsernamePressed(_ sender: UIButton) {
    showAlert(with: "Oops", and: "Your username is: \(userInfo.username)")
  }
  
  @IBAction func forgotPasswordPressed(_ sender: UIButton) {
    showAlert(with: "Oops", and: "Your password is: \(userInfo.password)")
  }
  
  @IBAction func unwindSeague(seague: UIStoryboardSegue) {
    usernameTextLabel.text = nil
    passwordTextLabel.text = nil
  }
}

// MARK: - Alert Controller
extension LoginViewController {

  private func showAlert(with title: String, and message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
      self.passwordTextLabel.text = nil
    }
    alert.addAction(okAction)
    present(alert, animated: true)
  }
}

// MARK: - Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    if textField == usernameTextLabel {
      textField.resignFirstResponder()
      passwordTextLabel.becomeFirstResponder()
    } else {
      loginPressed()
    }
    
    return true
  }
}
