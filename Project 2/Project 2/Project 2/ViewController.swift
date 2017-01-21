//
//  ViewController.swift
//  Project 2
//
//  Created by Benjamin Landau on 12/9/16.
//  Copyright © 2016 Benjamin Landau. All rights reserved.
//

import UIKit
import SafariServices

class ArticlesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   var article: Article!
    
    var image: UIImage!
    
    
   @IBOutlet weak var imageOutlet: UIImageView!
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageOutlet.image = image
        view.backgroundColor = UIColor.black
        Article.articles.removeAll()
        fetchData(requestString: newsSourceURL) { data in
            
            do {
                let objectData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
                let arrayOfDictionaries =  objectData["articles"] as! [[String : Any]]
                for dictionary in arrayOfDictionaries {
                    var author = dictionary["author"] as? String
                    
                    author = author?.replacingOccurrences(of: "By ", with: "")
                    
                    let title = dictionary["title"] as! String
                    let contentURL = dictionary["url"] as! String
                    let imageURL = (dictionary["urlToImage"] as? String) ?? ""
                    let publishedAt = (dictionary["publishedAt"] as? String) ?? ""
                    
                    
                    // because the publishedDate is actually a String, and not a real date, we need to use the class DateFormatter to create a date from that string
                    // an example of date would be "2016-12-15T22:05:24Z". We need to remove the T for Swift to understand the format
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ" // this is the format in which the news have the date
                    let publishedDate = dateFormatter.date(from: publishedAt.replacingOccurrences(of: "T", with: " ")) // we remove the T from the String
                    // we don't need to give the new article a variable name (handle), because when it's being created it appends itself in the articles array, which has a handle to all articles by index in the array.
                    
                    _ = Article(author: author ?? "", title: title, contentURL: contentURL, imageURL: imageURL, datePublished: publishedDate)
                }
            } catch { print(error.localizedDescription) }
            
            
            
            self.tableViewOutlet.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewOutlet.reloadData()
    }
    
    
    // here we use fetchData to retrieve the whole chunk with all articles. The value for the key "articles" is an array of dictionaries, each one of them being an article.
    // we need to parse the Json in each article to extract title, description, contentURL (URL), imageURL(utlToImage)
    // then we create (instanciate) an article object with the information:
    // let newArticle = Article(...) // do this for every article. Articles fetch their own content and picture, and put themselves inside the class singleton 'articles: [Article]'
    

    
    // this function retrieves data in raw format from a given URL.
    // once the data is received, it needs to be casted into the desired type or used to create the desired information
    func fetchData(requestString: String, completionHandler: @escaping (Data) -> ()) {  // <- turn Data to Data?
        guard let url = URL(string: requestString) else {
            completionHandler(Data()) // nil
            return
        }
        let urlRequest = URLRequest(url: url)
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            guard let responseData = data else {
                print("Error did not receive data")
                return
            }
            DispatchQueue.main.sync { completionHandler(responseData) }
        }
        task.resume()
    }
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return Article.articles.count }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! ArticleTableViewCell
        
        // IMPORTANT TRICK:
        // Here we are BINDING cell.imageOutlet.image to the result returning from an asyncronous call that fetches the image
        // BINDING means that, even if at the time we return the Cell, the fetchData hasn't yet returned the image,
        // because the result of the fetchData, which is an image is bound to the cell's 'image' property,
        // the tableView will call this function again in the background when the image is ready (fetched)
        
        if Article.articles[indexPath.row].imageURL != "" { // feches the image correstponding to the imageURL
            fetchData(requestString: Article.articles[indexPath.row].imageURL) { imageData in cell.imageOutlet.image = UIImage(data: imageData) }
        }
        cell.authorLabelOutlet.text = Article.articles[indexPath.row].author
        cell.titleLabelOutlet.text = Article.articles[indexPath.row].title
        cell.dateLabelOutlet.text = Article.articles[indexPath.row].datePublished?.prettyString
        cell.backgroundColor = UIColor.lightGray
        cell.authorLabelOutlet.textColor = UIColor.white
        cell.titleLabelOutlet.textColor = UIColor.white
        cell.dateLabelOutlet.textColor = UIColor.white
        return cell // here the image may not be fetched yet, but nevertheless it's BOUND to the cell's image property so this function will be called again
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let article = Article.articles[indexPath.row]
            let svc = SFSafariViewController(url: URL(string: article.contentURL)!)
            present(svc, animated: true, completion: nil)
        }
     }

        extension Date {
          var prettyString : String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd/MM/YY"
          return dateFormatter.string(from: self)
        }
     }
