//
//  Constants.swift
//  testRSS
//
//  Created by hager boussetta on 26/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import Foundation

struct Constants {
    // Server
    static let endpoint = "http://www.lemonde.fr/m-actu/rss_full.xml"

    // Get current language
    static var currentLanguage = Locale.preferredLanguages[0]
    
    static let isAppMocked = false
    
    //dateFormat
    static let RSSDateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
}

struct UITableViewCellIds {
    // Book
    static let RSSFeedTableViewCell = "rssFeedItemCell"
}
