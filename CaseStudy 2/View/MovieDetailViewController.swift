//
//  MovieDetailViewController.swift
//  CaseStudy 2
//
//  Created by prama niyogi on 20/03/23.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var posterImage: UILabel!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var strImage = ""
    var movieData : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movieData?.title
        detailTextView.text = movieData?.overview
        releaseDateLabel.text = movieData?.releaseDate
        
        let urlString = URL(string: strImage)
       // posterImage.kf.setImage(with: urlString)
        
    }
    

}
