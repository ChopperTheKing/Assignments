//
//  ViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var highSchools: [HighSchool] = []
    var dataSession: DataFetching!  // To be injected
    private var selectedIndex = 0
    private var schooldbn = ""
    private var schoolname = " "
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the table view's data source and delegate.
        tableView.dataSource = self
        tableView.delegate = self
        
        // Asynchronously fetch data for high schools.
        Task {
            do {
                try await self.fetchData(from: "")
            } catch {
                print("Failed to fetch data: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Data Fetching
    
    func fetchData(from urlString: String) async throws {
        if let session = dataSession {
            self.highSchools = try await session.fetchHighSchools()
        } else {
            print("dataSession is nil")
        }
        // Reload the table view on the main thread to reflect the fetched data.
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToSat" {
            // Transitioning to SATScoresViewController.
            _ = segue.destination as! SATScoresViewController
            // Commented code suggests there might be a plan to send school name data to the next view controller.
            // satViewController.name.text = viewModel.schools[selectedIndex].schoolName
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highSchools.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath)
        let school = highSchools[indexPath.row]
        cell.textLabel?.text = school.schoolName
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    // Add UITableViewDelegate methods here if needed
}

