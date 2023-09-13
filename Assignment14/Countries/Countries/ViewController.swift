//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

// ViewController.swift
import UIKit

class ViewController: UIViewController, UITableViewDataSource, NetworkManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var countries: [Country] = [] //holds list of countries that'll be displayed in table view.
    private let networkManager = NetworkManager() //instance of NetworkManager to make API call.
    
    override func viewDidLoad() { //Sets up initial state.
        super.viewDidLoad()
        networkManager.delegate = self
        
        tableView.dataSource = self //Sets data source of table view to self.
        tableView.dataSource = self
        networkManager.getCountries { countries, error in //Calls getCountries method to fetch countries.
            if let countries = countries { //Checks if countries were fetched successfully and reloads table view.
                self.countries = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else if let error = error { //Checks if error occurred and calls showError.
                DispatchQueue.main.async {
                    self.showError(error: error)
                }
            }
        }
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 1. Remove the country from your data source first
            countries.remove(at: indexPath.row)
            
            // 2. Delete the row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    func showError(error: Error) { //Shows alert if error occurs.
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //Sets up table view.
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Your existing cell configuration code for country data...
        let country = countries[indexPath.row]
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = "\(country.capital)"
        
        let rightLabel = UILabel()
        rightLabel.text = "\(country.currency.code), \(country.code)"
        rightLabel.font = UIFont.systemFont(ofSize: 12)
        rightLabel.sizeToFit()
        cell.accessoryView = rightLabel
        
        // Create a button
        let middleButton = UIButton(type: .system)
        middleButton.setTitle("Delete", for: .normal)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the button to the cell's contentView
        cell.contentView.addSubview(middleButton)
        
        // Set constraints: center Y and some space from the right
        middleButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        middleButton.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -30).isActive = true // Adjust -30 to any other value for more/less spacing
        
        // Set an action for the button tap
        middleButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return cell
    }


    @objc func buttonTapped(sender: UIButton) {
        // Identify which cell's button was tapped by getting its position in the table
        if let indexPath = tableView.indexPath(for: sender.superview!.superview as! UITableViewCell) {
            
            // 1. Remove the country from your data source
            countries.remove(at: indexPath.row)
            
            // 2. Delete the row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    
    func didFetchCountries(_ countries: [Country]) { //Make ViewController conform to NetworkManagerDelegate protocol
        self.countries = countries
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func didFailWithError(_ error: Error) {
        DispatchQueue.main.async {
            self.showError(error: error)
        }
    }
    
}
