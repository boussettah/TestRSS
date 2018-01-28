//
//  UIViewControllerExtension.swift
//  testRSS
//
//  Created by hager boussetta on 26/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import UIKit
import TTGSnackbar

extension UIViewController
{
    func showSnack(message: String, isDisplayOnTop: Bool)
    {
        let snackbar: TTGSnackbar = TTGSnackbar.init(message: message, duration: .long)

        if(isDisplayOnTop)
        {
            snackbar.animationType = .slideFromTopBackToTop
        }
        snackbar.show()
    }
    
    func showAlert(_ title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

