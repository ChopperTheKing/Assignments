//
//  SATScoresViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import UIKit

class SATScoresViewController: UIViewController, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var satScore: SATScore?
    
    enum SATSection: Int, CaseIterable {
        case reading
        case math
        case writing
        
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ScoreCell")
    }

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SATSection.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath)
        
        guard let section = SATSection(rawValue: indexPath.row) else {
            return cell
        }
        
        cell.textLabel?.text = "\(section.displayTitle): \(section.score(from: satScore))"
        return cell
    }
}
