//
//  DataModel.swift
//  Project 2
//
//  Created by Benjamin Landau on 12/15/16.
//  Copyright © 2016 Benjamin Landau. All rights reserved.
//

import Foundation
import UIKit

var newsSourceURL = ""

class Article {
    
    static var articles = [Article]()
    
    var author: String?
    var title: String
    var contentURL: String // this is used to retrieve 'content'
    var imageURL: String // this is used to retrieve 'image'
    var image: UIImage?
    var datePublished: Date?
    
    init(author: String?, title: String, contentURL: String, imageURL: String = "", datePublished: Date? = nil){
        self.author = author
        self.title = title
        self.contentURL = contentURL
        self.imageURL = imageURL
        self.datePublished = datePublished
        
        
        
        Article.articles.append(self) // self is the article being created
    }

//    func fetchData(requestString: String, completionHandler: @escaping (Data) -> ()) {
//        let urlRequest = URLRequest(url: URL(string: requestString)!)
//        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
//        let task = urlSession.dataTask(with: urlRequest) { (data, response, error) in
//            guard let responseData = data else {
//                print("Error did not receive data")
//                return
//            }
//            DispatchQueue.main.sync { completionHandler(responseData) }
//        }
//        task.resume()
//    }
 
}







