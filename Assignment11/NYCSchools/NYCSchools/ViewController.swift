//
//  ViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import UIKit

// ViewController.swift
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var highSchools: [HighSchool] = []
    let service = Service()
    var satScores: [SATScore] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchDataAndMerge()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highSchools.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolCell", for: indexPath)
        let school = highSchools[indexPath.row]
        cell.textLabel?.text = school.school_name
        return cell
    }

    func fetchDataAndMerge() {
        service.fetchHighSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.highSchools = schools

                self?.service.fetchSATScores { result in
                    switch result {
                    case .success(_):
                        
                        if let enumeratedSchools = self?.highSchools.enumerated() {
                            for (index, school) in enumeratedSchools {
                                if let matchingSAT = self?.satScores.first(where: { $0.dbn == school.dbn }) {
                                    self?.highSchools[index].satScore = matchingSAT
                                }
                            }
                        }


                        
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
}
