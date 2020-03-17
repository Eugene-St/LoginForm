//
//  UIViewGradient.swift
//  LoginForm
//
//  Created by Eugene St on 17.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

extension UIView {
  func setGradientBackColor(colorone: UIColor, colorTwo: UIColor, colorThree: UIColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [colorone.cgColor, colorTwo.cgColor, colorThree.cgColor]
    gradientLayer.locations = [0.0, 0.5, 1.0]
    gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
    layer.insertSublayer(gradientLayer, at: 0)
  }
}
