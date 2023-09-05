//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    private var countries: [Country] = []
    private var networkService: NetworkService = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        networkService.getCountries { countries, error in
            self.countries = countries ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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

