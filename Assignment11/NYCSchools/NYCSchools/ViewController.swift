//
//  ViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import UIKit

// This class represents the main view controller that manages and displays a list of high schools.
class ViewController: UIViewController {
    
    // UI reference to the table view.
    @IBOutlet weak var tableView: UITableView!
    
    // An array to store high school data.
    var highSchools: [HighSchool] = []
    
    // An instance of a session to manage data operations.
    let dataSession = DataSession()
    
    // Index to track the selected school in the table view.
    var selectedIndex = 0
    
    // Variables to hold the dbn and name of the selected school.
    var schooldbn = ""
    var schoolname = " "
    
    // Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the table view's data source and delegate.
        tableView.dataSource = self
        tableView.delegate = self
        
        // Asynchronously fetch data for high schools.
        Task {
            await self.dataSession.fetchData(from: self.dataSession.highSchoolsURL)
            print(dataSession.schools)
            // Reload the table view to reflect the fetched data.
            self.tableView.reloadData()
        }
    }
    
    // Prepare data before navigation to another view controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToSat" {
            // Transitioning to SATScoresViewController.
            let satViewController = segue.destination as! SATScoresViewController
            // Commented code suggests there might be a plan to send school name data to the next view controller.
            // satViewController.name.text = viewModel.schools[selectedIndex].schoolName
        }
    }
}

// Extension of the ViewController to conform to UITableView's DataSource and Delegate protocols.
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Returns the number of rows in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)  -> Int {
        print(self.dataSession.schools.count)
        return dataSession.schools.count
    }
    
    // Provides the table view cells to display.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell and attempt to cast it as a ScoreCell.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolCell", for: indexPath) as? ScoreCell else { return UITableViewCell() }
        
        // Set the school's name for the cell.
        cell.title.text = self.dataSession.schools[indexPath.item].schoolName
        
        // cell.location.text = viewModel.schools[indexPath.item].location
        // cell.website.text = viewModel.schools[indexPath.item].website
        
        // A commented callback for deleting a school item from the list.
        /*cell.didDelete = {
            self.viewModel.schools.remove(at:indexPath.item)
            var tempSchool = self.viewModel.schools
            self.viewModel.schools = tempSchool
            self.tableView.reloadData()
        }*/
        
        return cell
    }
    
    // Handle the event when a table view row is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.schooldbn = dataSession.schools[selectedIndex].dbn ?? ""
        self.schoolname = dataSession.schools[selectedIndex].schoolName ?? ""
        
        // Instantiate and navigate to SATScoresViewController, passing the selected school's name and dbn.
        if let viewController = storyboard?.instantiateViewController(identifier: "satViewController") as? SATScoresViewController {
            viewController.namePlaceHolder = self.schoolname
            viewController.dbnPlaceHolder = self.schooldbn
                
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        // Deselect the row after the action.
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
