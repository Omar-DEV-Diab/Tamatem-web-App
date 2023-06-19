//
//  ViewController.swift
//  Tamatem web App
//
//  Created by Omar Diab on 6/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func openBrowserBtn(_ sender: Any) {
        let URL = "https://tamatemplus.com"
        self.performSegue(withIdentifier: "openBrowser", sender: URL)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openBrowser") {
        }
    }
}
