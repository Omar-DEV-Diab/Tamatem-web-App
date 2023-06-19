//
//  URLModel.swift
//  Tamatem web App
//
//  Created by Omar Diab on 6/19/23.
//

import Foundation

struct URLModel {
    let homeURL = "https://tamatemplus.com"
    
    func getHomeURL() -> URL {
        return URL(string: homeURL)!
    }
}
