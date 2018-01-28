//
//  DataManager.swift
//  testRSS
//
//  Created by hager boussetta on 26/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireRSSParser
// Manage data for the application
class DataManager : NSObject
{
    static let sharedInstance = DataManager()
    
    func requestWS(type : Alamofire.HTTPMethod, url : String, callbackSuccess:@escaping  (RSSFeed) -> Void, callbackFailure:@escaping (Error) -> Void)
    {
       Alamofire.request(url).responseRSS() { (response) -> Void in
            if let feed: RSSFeed = response.result.value {
                 callbackSuccess(feed)
            }
            else {
                 callbackFailure(response.error!)
            }
        }
    }
}
