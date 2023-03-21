//
//  AppUrl.swift
//  CaseStudy 2
//
//  Created by prama niyogi on 20/03/23.
//

import Foundation
import UIKit

struct AppUrl {
    
    struct Domains {
        static let url = "https://api.themoviedb.org/3/"
        static let endPoint = "movie/popular?"
        static let baseURL = url + endPoint
        static let apiKey = "5c97521cfb34d793628c08dc302addc5"
        
        static let urlString = Domains.baseURL + "api_key=" + Domains.apiKey
        
        static let domain = URL(string: urlString)
    }
}

//https://api.themoviedb.org/3/movie/popular?api_key=5c97521cfb34d793628c08dc302addc5
