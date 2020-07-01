//
//  ArticleWebViewController.swift
//  RKVajroTask
//
//  Created by ramakrishna utti on 30/06/20.
//  Copyright © 2020 ramakrishnautti. All rights reserved.
//

import UIKit
import WebKit
class ArticleWebViewController: UIViewController {
    @IBOutlet weak var webViewArticalDetails: WKWebView!
    var htmlString : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.loadHTMLStringImage()
    }
    func loadHTMLStringImage(){
        if let webContent = self.htmlString {
            webViewArticalDetails.backgroundColor = UIColor.white
            webViewArticalDetails.loadHTMLString(webContent, baseURL: nil)
        }
        else{
            
        }
    }
    @IBAction func backAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    

}
