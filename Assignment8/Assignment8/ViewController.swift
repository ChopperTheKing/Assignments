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
    
    struct Country: Decodable { //holds country data
        let name: String
        let capital: String
        let code: String
        let currency: Currency
        let region: String
    }
    
    struct Currency: Decodable { //holds currency data
        let code: String
        let name: String
        let symbol: String?
    }
    
    override func viewDidLoad() { //Table view's data source and delegate are set to the view controller itself
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchCountriesData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { //sets the number of sections in the table view to 1.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //sets the number of rows in the table view to the count of the countries array.
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //configures each cell in the table view. It sets the text, font, and accessory views according to the country data.
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
    
    func fetchCountriesData() { //fetches the JSON data of countries using a URLSession data task.
        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in //fetches the JSON data of countries using a URLSession data task
            guard let data = data else { return }
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData() //Once the data is fetched and decoded into Country objects, it updates the countries array and reloads the table view on the main thread.
                }
            } catch let jsonErr { //If any error occurs during JSON decoding, it's printed to the console.
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
}
