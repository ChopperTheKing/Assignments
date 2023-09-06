//
//  ViewController.swift
//  Assignment8
//
//  Created by Ronnie Kissos on 9/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countries: [Country] = []
    
    struct Country: Decodable {
        let name: String
        let capital: String
        let code: String
        let currency: Currency
        let region: String
    }
    
    struct Currency: Decodable {
        let code: String
        let name: String
        let symbol: String?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchCountriesData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        let country = countries[indexPath.row]
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = "\(country.capital)"
        
        let rightLabel = UILabel()
        
        rightLabel.text = "\(country.currency.code), \(country.code)"
        
        rightLabel.font = UIFont.systemFont(ofSize: 12)
        rightLabel.sizeToFit()
        
        cell.accessoryView = rightLabel

        return cell
    }
    
    func fetchCountriesData() {
        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
}
