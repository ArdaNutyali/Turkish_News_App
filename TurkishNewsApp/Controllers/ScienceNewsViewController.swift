//
//  ScienceNewsViewController.swift
//  TurkishNewsApp
//
//

import UIKit
import SDWebImage
import SafariServices

class ScienceNewsViewController: UIViewController {

    var newsArray = [Article]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNews(newsInput: K.NewsCategories.science) { data in
            self.newsArray = data
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.separatorInset.right = 0
        tableView.separatorInset.left = 0
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ScienceNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.scienceNewsCell, for: indexPath) as! ScienceNewsCell
        cell.newsLabel.text = newsArray[indexPath.row].title
        cell.newsImageView.sd_setImage(with: newsArray[indexPath.row].urlToImage) { image, error, cache, url in
            if error != nil {
                cell.newsImageView.image = UIImage(named: "news")
            }
            else {
                cell.newsImageView.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let url = URL(string: newsArray[indexPath.row].url) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
        }
    }
}
