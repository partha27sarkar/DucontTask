//
//  MainViewModel.swift
//  ParthaSarkarAssignment
//
//  Created by Partha Sarkar on 24/07/18.
//  Copyright © 2018 Partha Sarkar. All rights reserved.
//
//http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api- key=99ac37d97d2b4478aa5ac46830c548e4

import Foundation

struct APIUrl {
    static let baseUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections"
    static let key = "99ac37d97d2b4478aa5ac46830c548e4"
}

class MainViewModel {
    static let shared = MainViewModel()
    
    typealias ErrorHandling = (String) -> Void
    typealias ResponseHandling = ([NYTimeModel]) -> Void
    
    var apiData = [NYTimeModel]()
    
    func getMostPopularAPI(_ completion : @escaping ResponseHandling, errorHandling : @escaping ErrorHandling){
        let url = URL(string: "\(APIUrl.baseUrl)/7.json?api-key=\(APIUrl.key)")
        if let usableUrl = url {
            let request = URLRequest(url: usableUrl)
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    do {
                        let myStruct = try JSONDecoder().decode(Response.self, from: data)
                        completion(myStruct.results ?? [])
                    }catch let err {
                        errorHandling(err.localizedDescription)
                    }
                }else {
                    errorHandling("Failed to get data")
                }
            })
            task.resume()
        }
    }
    
}
