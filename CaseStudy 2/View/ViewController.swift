//
//  ViewController.swift
//  CaseStudy 2
//
//  Created by prama niyogi on 17/03/23.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ViewController: UIViewController {
    var movieList = [[String : Any]]()
    let disposeBag = DisposeBag()
    @IBOutlet weak var movieTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    func bindData() {
        APIServices.apiInstance.fetchPopularMovies()
          //  .observe(on: MainScheduler.instance)
            .bind(to: movieTable.rx.items(cellIdentifier: "cell", cellType: MovieTableViewCell.self)) { index, model, cell in
              
                cell.movieTitle.text = model.title
                let posterPath = model.posterPath as! String
                if let urlposter = URL(string:"https://image.tmdb.org/t/p/original" + posterPath){
                    cell.movieImage.kf.setImage(with: urlposter)
                }
              
            }
        movieTable.rx.modelSelected(Movie?.self).subscribe(onNext: {
            movieDetailItem in
            print("you Selected:", movieDetailItem?.title)
   
            guard let movieDetailVC = self.storyboard?.instantiateViewController(identifier: "MovieDetailViewController") as? MovieDetailViewController else {
                fatalError("task controllers not found")
            }
            movieDetailVC.movieData = movieDetailItem
            movieDetailVC.movieData = movieDetailItem
            movieDetailVC.movieData = movieDetailItem
            
            let posterPath = movieDetailItem?.posterPath
            let urlposter =  "https://image.tmdb.org/t/p/original" + posterPath!
            movieDetailVC.strImage = urlposter
            print(urlposter)
            
            self.navigationController?.pushViewController(movieDetailVC, animated: true)
            
        })
           .disposed(by: disposeBag)
    }


}

