//
//  RSSFeed.swift
//  testRSS
//
//  Created by hager boussetta on 26/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import UIKit
import AlamofireRSSParser
class RSSFeedItem: NSObject {
    
    public var titleFeed: String?
    
    public var linkFeed: String?
    
    public var descriptionFeed: String?
    
    /// Example: Sat, 18 Sep 2018 00:00:01 GMT
    public var pubDateFeed: String?
    
    public var iconPath : String?
    
    init(rssItem : RSSItem)
    {
      titleFeed = rssItem.title
      linkFeed = rssItem.guid
      descriptionFeed = rssItem.itemDescription
      if let pubDate = rssItem.pubDate
      {
        pubDateFeed = pubDate.formatString(Constants.RSSDateFormat)
      }
      if let enclosure = rssItem.enclosures
      {
        iconPath = enclosure[0]["url"]
      }
    }
}
