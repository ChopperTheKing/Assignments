//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

// ViewController.swift
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var countries: [Country] = []
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        networkManager.getCountries { countries, error in
            if let countries = countries {
                self.countries = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    self.showError(error: error)
                }
            }
        }
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = countries[indexPath.row]
        cell.textLabel?.text = "\(country.name)"
    
        return cell
    }
}
