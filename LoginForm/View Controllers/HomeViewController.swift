//
//  HomeViewController.swift
//  LoginForm
//
//  Created by Eugene St on 16.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
 
  @IBOutlet var welcomeLabel: UILabel!
  @IBOutlet var logOutButton: UIButton!
  
  var userNameFromLoginScreen: String!

    override func viewDidLoad() {
        super.viewDidLoad()
      view.setGradientBackColor(colorone: .white, colorTwo: .gray, colorThree: .darkGray)
      welcomeLabel.text = "Welcome, \(userNameFromLoginScreen!)!"
      logOutButton.layer.cornerRadius = 20
    }
  
}
