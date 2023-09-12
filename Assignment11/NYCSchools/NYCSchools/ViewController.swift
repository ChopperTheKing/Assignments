//
//  ViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var highSchools: [HighSchool] = []
    let service = Service()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchDataAndMerge()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSATScores",
           let destinationVC = segue.destination as? SATScoresViewController,
           let selectedIndex = tableView.indexPathForSelectedRow?.row {
            destinationVC.satScore = highSchools[selectedIndex].satScore
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func fetchDataAndMerge() {
        service.fetchHighSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.highSchools = schools

                self?.service.fetchSATScores { result in
                    switch result {
                    case .success(let satScores):
                        print("Successfully fetched \(satScores.count) SAT scores.") // Here's the print statement.
                        self?.mergeSATScoresWithSchools(using: satScores)

                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            // Handle the error (e.g., show an alert)
                            print("Error fetching SAT scores: \(error.localizedDescription)")
                        }
                    }
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    // Handle the error (e.g., show an alert)
                    print("Error fetching high schools: \(error.localizedDescription)")
                }
            }
        }
    }


    func mergeSATScoresWithSchools(using satScores: [SATScore]) {
        for (index, school) in self.highSchools.enumerated() {
            if let matchingSAT = satScores.first(where: { $0.dbn == school.dbn }) {
                self.highSchools[index].satScore = matchingSAT
            }
        }
    }



}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highSchools.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolCell", for: indexPath)
        let school = highSchools[indexPath.row]
        cell.textLabel?.text = school.school_name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    // Add delegate methods if required
}
