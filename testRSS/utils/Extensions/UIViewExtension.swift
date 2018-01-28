//
//  UIViewExtension.swift
//  testRSS
//
//  Created by hager boussetta on 28/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import UIKit

// MARK: - UIView
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var roundedRadius: Bool {
        get {
            return layer.frame.width == layer.frame.height ? layer.cornerRadius == layer.frame.width / 2 : false
        }
        set {
            let size = max(layer.frame.width, layer.frame.height)
            layer.cornerRadius = size / 2
            layer.masksToBounds = true
        }
    }
}

