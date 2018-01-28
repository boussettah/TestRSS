//
//  StringExtension.swift
//  testRSS
//
//  Created by hager boussetta on 26/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import Foundation
import UIKit
//Translate String
extension String {
    func localized() -> String
    {
        if let path = Bundle.main.path(forResource: Constants.currentLanguage, ofType: "lproj")
        {
            let bundle = Bundle(path: path)
            
            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        }
        
        if let path = Bundle.main.path(forResource: "Base", ofType: "lproj")
        {
            let bundle = Bundle(path: path)
            
            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        }
        
        return ""
    }
}

