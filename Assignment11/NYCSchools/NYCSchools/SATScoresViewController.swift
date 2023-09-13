//
//  SATScoresViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation
import UIKit

class SATScoresViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var satScore: SATScore?
    
    // An enum to represent the different SAT sections and retrieve the appropriate scores
    enum SATSection: Int, CaseIterable {
        case reading, math, writing

        var displayTitle: String {
            switch self {
            case .reading: return "Reading Score"
            case .math: return "Math Score"
            case .writing: return "Writing Score"
            }
        }

        func score(from satScore: SATScore?) -> String {
            switch self {
            case .reading: return satScore?.sat_critical_reading_avg_score ?? "N/A"
            case .math: return satScore?.sat_math_avg_score ?? "N/A"
            case .writing: return satScore?.sat_writing_avg_score ?? "N/A"
            }
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Setup Methods
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(ScoreCell.self, forCellReuseIdentifier: "ScoreCell")
    }
}

// MARK: - UITableViewDataSource
extension SATScoresViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SATSection.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath) as! ScoreCell
        
        if let section = SATSection(rawValue: indexPath.row) {
            cell.textLabel?.text = "\(section.displayTitle): \(section.score(from: satScore))"
        }

        return cell
    }



}
