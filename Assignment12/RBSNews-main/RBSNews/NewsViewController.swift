//
//  NewsViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {
    
    var newsViewModel: NewsViewModel? //handles data fetching and business logic for the view controller.
    var articles: [Article]? //optional array that holds the fetched news articles.
    @IBOutlet weak var newsTableView: UITableView! //will display the list of news articles.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News screen"
        newsViewModel = NewsViewModel()
        newsViewModel?.fetchNews { [weak self] result in //Calls the fetchNews method on the view model to get news articles.
            switch result {
            case .success(let news):
                self?.articles = news.articles //fetched articles are assigned to the articles property
                self?.newsTableView.reloadData()
            case .failure(let error):
                print("Failed to fetch news:", error.localizedDescription)
            }
        }
    }

    
}

extension NewsViewController: UITableViewDataSource { //determine the number of rows in the table view and provide cells for each row:
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = articles else {
            return 0 //Returns the number of articles, or 0 if there are no articles.
        }
        return articles.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { // Dequeues a reusable cell and configures it with data from the respective article.
            return UITableViewCell() //f the cell cannot be cast as NewsTableViewCell, it returns a default UITableViewCell.
        }
        
        if let article = articles?[indexPath.row], let source = article.source {
            cell.setupNewsCell(source: source.name, title: article.title ?? "No title available")
                
            if let imageUrl = article.urlToImage {
                cell.setupNewsImage(imageURL: imageUrl)
            }
        }

        
        return cell
    }
}

extension NewsViewController: UITableViewDelegate { //When a table view cell (i.e., a news article) is tapped, this method will open the article's URL in a SFSafariViewController.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = articles?[indexPath.row], let urlString = article.url, let url = URL(string: urlString) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
            safariViewController.delegate = self
        }
    }
}

extension NewsViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) { //called when the SFSafariViewController is closed by the user.
        controller.dismiss(animated: true, completion: nil) //dismisses the Safari view controller.
    }
}
