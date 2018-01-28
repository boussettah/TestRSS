//
//  DetailsFeedItemViewController.swift
//  testRSS
//
//  Created by hager boussetta on 27/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import UIKit

class DetailsFeedItemViewController: UIViewController {

     var rssFeedItem : RSSFeedItem!
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var contentImageView: UIImageView?
    @IBOutlet weak var dateTime : UILabel!
    @IBOutlet weak var contentTextView : UITextView!

    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        titleLabel.text = rssFeedItem.titleFeed
        contentTextView.text = rssFeedItem.descriptionFeed
        dateTime.text = rssFeedItem.pubDateFeed
        
        if let thumbnailURL = rssFeedItem.iconPath
        {
            contentImageView?.kf.setImage(with: URL(string: thumbnailURL) , placeholder: UIImage(named: "placeholder.png"))
        }
        // Do any additional setup after loading the view.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let moreDetailsNavigationControler = segue.destination as! UINavigationController
        let moreDetailsViewController = moreDetailsNavigationControler.viewControllers[0] as! MoreDetailsIFeedItemViewController
        moreDetailsViewController.itemFeedURL = rssFeedItem.linkFeed
    }
}
