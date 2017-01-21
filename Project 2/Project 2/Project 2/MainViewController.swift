//
//  MainViewController.swift
//  Project 2
//
//  Created by Benjamin Landau on 12/20/16.
//  Copyright © 2016 Benjamin Landau. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
//    
//let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesListViewController")
//    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func newsSource1(_ sender: UIButton) {
        
        newsSourceURL = "https://newsapi.org/v1/articles?source=fox-sports&sortBy=top&apiKey=b1f4b3b86ecd40559c4f7072a98f95fe"
            
        let articlesListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesListViewController") as! ArticlesListViewController
        articlesListViewController.modalPresentationStyle = .overFullScreen
        present(articlesListViewController, animated: true, completion: nil)
        performSegue(withIdentifier: "seg1", sender: UIButton())
    }

    @IBAction func newsSource2(_ sender: UIButton) {
        
        newsSourceURL = "https://newsapi.org/v1/articles?source=ign&sortBy=top&apiKey=b1f4b3b86ecd40559c4f7072a98f95fe"
        

        let articlesListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesListViewController") as! ArticlesListViewController
        articlesListViewController.modalPresentationStyle = .overFullScreen
        present(articlesListViewController, animated: true, completion: nil)
         func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationViewController = segue.destination as! ArticlesListViewController
            if segue.identifier == "seg2" {
               destinationViewController.imageOutlet.image = UIImage(named: "Cnn.svg")
            }
                    }

        performSegue(withIdentifier: "seg2", sender: UIButton())
    }
    
        
    
    @IBAction func newsSource3(_ sender: UIButton) {
        
        newsSourceURL = "https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=b1f4b3b86ecd40559c4f7072a98f95fe"
        let articlesListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesListViewController") as! ArticlesListViewController
        articlesListViewController.modalPresentationStyle = .overFullScreen
        present(articlesListViewController, animated: true, completion: nil)
        
}

    @IBAction func timeButton(_ sender: Any) {
        
        
        
        newsSourceURL = "https://newsapi.org/v1/articles?source=time&sortBy=top&apiKey=b1f4b3b86ecd40559c4f7072a98f95fe"
        let articlesListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesListViewController") as! ArticlesListViewController
        articlesListViewController.modalPresentationStyle = .overFullScreen
        present(articlesListViewController, animated: true, completion: nil)
        
        
        
        
        
        
    }
   
    @IBAction func wsjButton(_ sender: Any) {
        
        
        newsSourceURL = "https://newsapi.org/v1/articles?source=the-wall-street-journal&sortBy=top&apiKey=b1f4b3b86ecd40559c4f7072a98f95fe"
        let articlesListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesListViewController") as! ArticlesListViewController
        articlesListViewController.modalPresentationStyle = .overFullScreen
        present(articlesListViewController, animated: true, completion: nil)
        
        
        
        
        
    }
    @IBAction func natGeoBtn(_ sender: Any) {
        
        newsSourceURL = "https://newsapi.org/v1/articles?source=national-geographic&sortBy=top&apiKey=b1f4b3b86ecd40559c4f7072a98f95fe"
        let articlesListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesListViewController") as! ArticlesListViewController
        articlesListViewController.modalPresentationStyle = .overFullScreen
        present(articlesListViewController, animated: true, completion: nil)
        
        
        
        
    }
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


