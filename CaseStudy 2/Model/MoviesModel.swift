//
//  Movies.swift
//  CaseStudy 2
//
//  Created by prama niyogi on 17/03/23.
//

import Foundation

struct Movie {
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String
  
    //initializers that take a dictionary as input
    init?(movieList: [String: Any]) {
        //guard statement checks if all the required properties can be extracted from the input dictonary , return nil if any of them is missing or has a wrong type
        guard let title = movieList["title"] as? String,
              let overview = movieList["overview"] as? String,
              let releaseDate = movieList["release_date"] as? String,
              let posterPath = movieList["poster_path"] as? String else {
            return nil
        }
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
    }
}
