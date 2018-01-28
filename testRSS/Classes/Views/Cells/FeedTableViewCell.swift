//
//  FeedTableViewCell.swift
//  testRSS
//
//  Created by hager boussetta on 26/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import UIKit
import Kingfisher

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var  labelTitle: UILabel!
    @IBOutlet weak var  labelDate: UILabel!
    @IBOutlet weak var  thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCellWithData(rssFeedItem : RSSFeedItem)
    {
        labelTitle.text = rssFeedItem.titleFeed
        labelDate.text = rssFeedItem.pubDateFeed
         if let thumbnailURL = rssFeedItem.iconPath
         {
            thumbnailImageView.kf.setImage(with: URL(string: thumbnailURL) , placeholder: UIImage(named: "placeholder.png"))
         }
    }
}
