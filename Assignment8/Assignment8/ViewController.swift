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
    
    struct Product: Decodable {
        let name: String
        let price: Int
        let features: [String]
    }
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchCountriesData()
        parseProductJSON()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return countries.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator // adds the arrow to the right side
        
        if indexPath.section == 0 {
            let country = countries[indexPath.row]
            
            // Make the country name bold
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
            
            cell.textLabel?.text = country.name
            cell.detailTextLabel?.text = "\(country.capital)"
            
            let rightLabel = UILabel()
            
            // Display the region code instead of the currency code
            rightLabel.text = "\(country.region), \(country.code)"
            
            rightLabel.font = UIFont.systemFont(ofSize: 12)
            rightLabel.sizeToFit()  // This will make the label only as big as it needs to be
            
            cell.accessoryView = rightLabel
        } else {
            if let product = product {
                cell.textLabel?.text = product.name
                cell.detailTextLabel?.text = "Price: \(product.price), Features: \(product.features.joined(separator: ", "))"
            }
        }
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
    
    func parseProductJSON() {
        let jsonData = """
        {
            "name": "iPhone",
            "price": 999,
            "features": ["Face ID", "OLED Display"]
        }
        """.data(using: .utf8)!
        
        do {
            self.product = try JSONDecoder().decode(Product.self, from: jsonData)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Error:", error)
        }
    }
}
