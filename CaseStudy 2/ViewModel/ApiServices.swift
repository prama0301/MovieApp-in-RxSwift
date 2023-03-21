//
//  Api services.swift
//  CaseStudy 2
//
//  Created by prama niyogi on 17/03/23.
//

import Foundation
import RxSwift
import Alamofire

class APIServices {
    static let apiInstance = APIServices()
    // funtion which return Observable object that emits an array of movie object
    func fetchPopularMovies() -> Observable<[Movie]> {
        // create new observable object that can be subscribed by other components
        //The returned  objects emit the value asynchronously allowing for non blocking process of network request
        return Observable.create { observer in
            
            let urlString = AppUrl.Domains.domain!
            Alamofire.request(urlString).responseJSON { response in
                switch response.result {
     //after recieving the response it will check if response is success or failure
                case .success(let value):
                    // if success the extract array of Movie data from the JSON
                    guard let json = value as? [String: Any],
                          let dataArray = json["results"] as? [[String: Any]] else {
                        observer.onError(NSError(domain: "APIError", code: -1, userInfo: nil))
                        return
                    }
                    let movies = dataArray.compactMap { Movie(movieList: $0) }
                    observer.onNext(movies)
               //once all movie have been emmited,it call onComplete
                    observer.onCompleted()
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            // it is called to ensure that any resources used by Observable are cleaned up when the obsservable are disposed of
            return Disposables.create()
        }
    }
}

