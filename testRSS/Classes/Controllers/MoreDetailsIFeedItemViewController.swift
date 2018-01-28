//
//  MoreDetailsIFeedItemViewController.swift
//  testRSS
//
//  Created by hager boussetta on 28/01/2018.
//  Copyright © 2018 hager boussetta. All rights reserved.
//

import UIKit
import WebKit

class MoreDetailsIFeedItemViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var itemFeedURL: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let itemFeedURlValue = itemFeedURL else
        {
            showSnack(message: LocalizedConstants.commonErrorAnErrorOccur, isDisplayOnTop: false)
            return
        }
        
        itemFeedURL =  itemFeedURlValue.replacingOccurrences(of: " ", with:"")
        itemFeedURL =  itemFeedURlValue.replacingOccurrences(of: "\n", with:"")
      
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: itemFeedURL!)!))
    }
   
    @IBAction func Cancel(sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MoreDetailsIFeedItemViewController : WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicatorView.stopAnimating()
    }
    
}
