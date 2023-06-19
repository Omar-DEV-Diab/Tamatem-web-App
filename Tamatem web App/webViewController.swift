//
//  webViewController.swift
//  Tamatem web App
//
//  Created by Omar Diab on 6/18/23.
//

import UIKit
import WebKit

class webViewController: UIViewController, WKNavigationDelegate {
    var URLModel:URLModel?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    }
}
