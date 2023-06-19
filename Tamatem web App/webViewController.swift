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
    
    @IBOutlet weak var closeBtn: UIBarButtonItem!
    
    // Web Browser navigator
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    @IBOutlet weak var reloadBtn: UIBarButtonItem!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.canGoBack), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.canGoForward), options: .new, context: nil)
        
        progressView.progressTintColor = .red
        
        backBtn.isEnabled = webView.canGoBack
        backBtn.action = #selector(WKWebView.goBack)
        
        forwardBtn.isEnabled = webView.canGoForward
        forwardBtn.action = #selector(WKWebView.goForward)
        progressView.isHidden = false
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        webView.reload()
    }
    //OD: Monitoring page loading progress and navigation ability
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.canGoForward)  {
            forwardBtn.isEnabled = webView.canGoForward
            return
        }
        if keyPath == #keyPath(WKWebView.canGoBack)  {
            backBtn.isEnabled = webView.canGoBack
            return
        }
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    //OD: Show the progress bar when start loading
    func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
        if progressView.isHidden {
            progressView.isHidden = false
        }
    }
            
    //OD: Hide the progress bar when finish loading
    internal func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.isHidden = true
    }
    }
}
