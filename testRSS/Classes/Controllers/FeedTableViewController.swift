//
//  FeedTableViewController.swift
//  testRSS
//
//  Created by hager boussetta on 26/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireRSSParser
import NVActivityIndicatorView

class FeedTableViewController: UITableViewController, NVActivityIndicatorViewable {

    var rssFeedItems : [RSSFeedItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }

    func setupUI()
    {
        self.navigationController?.hidesBarsOnSwipe = true
        
        let refreshControl : UIRefreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(FeedTableViewController.refresh(sender:)), for: UIControlEvents.valueChanged)
        self.refreshControl = refreshControl
        
        //hide empty Rows in uitableView
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.estimatedRowHeight = 140
    }
    
    func loadData() {
        
        self.startAnimating()
        DataManager.sharedInstance.requestWS(type: HTTPMethod.get, url: Constants.endpoint , callbackSuccess: successCallback, callbackFailure: failureCallback)
    }
    
    @objc func refresh(sender:AnyObject) {
        self.loadData()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let detailsViewController = segue.destination as! DetailsFeedItemViewController
        let currentIndexPath = tableView.indexPath(for: sender as! FeedTableViewCell)
        detailsViewController.rssFeedItem = rssFeedItems[(currentIndexPath?.row)!]
    }
}

// MARK: - Table view data source
extension FeedTableViewController
{
   override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rssFeedItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIds.RSSFeedTableViewCell, for: indexPath) as! FeedTableViewCell
        let rssFeedItem = rssFeedItems[indexPath.row]
        // Configure the cell...
        cell.configureCellWithData(rssFeedItem: rssFeedItem)
        return cell
    }
}

// MARK:- Request Callbacks
extension FeedTableViewController
{
    func successCallback( xmlData : RSSFeed){
        
        self.stopAnimating()
        self.rssFeedItems = xmlData.items.map{
            
            return RSSFeedItem(rssItem: $0)
        }
        self.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    
    func failureCallback(error : Error){
        self.stopAnimating()
        self.showSnack(message: LocalizedConstants.commonErrorUnableToGetData, isDisplayOnTop: false)
        self.refreshControl?.endRefreshing()
    }
}
