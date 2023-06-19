//
//  ViewController.swift
//  Tamatem web App
//
//  Created by Omar Diab on 6/18/23.
//

import UIKit

class ViewController: UIViewController {
    private let segueIdentifier = "openBrowser"
    
    @IBAction func openBrowserBtn(_ sender: Any) {
        let URL = URLModel()
        self.performSegue(withIdentifier: segueIdentifier, sender: URL)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == segueIdentifier) {
              let secondView = segue.destination as! webViewController
            secondView.URLModel = sender as? URLModel
        }
    }
}
