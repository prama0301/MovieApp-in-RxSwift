//
//  CollectionViewController.swift
//  CaseStudy 2
//
//  Created by prama niyogi on 18/03/23.
//

import UIKit
import RxCocoa
import RxSwift

class CollectionViewController: UIViewController {
    let disposeBag = DisposeBag()
    @IBOutlet weak var MovieCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCollectionData()
        // Do any additional setup after loading the view.
    }
    func bindCollectionData() {
        APIServices.apiInstance.fetchPopularMovies().bind(to: MovieCollection.rx.items(cellIdentifier: "cell", cellType: MovieCollectionViewCell.self)){ index, model, cell in
            
            let urlImage = model.posterPath as! String
            if let urlposter = URL(string:"https://image.tmdb.org/t/p/original" + urlImage){
                cell.collectionImage.kf.setImage(with: urlposter)
                
            }
        }
        .disposed(by: disposeBag)
        
        
    }
}
