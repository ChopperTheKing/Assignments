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
    
    @IBOutlet weak var Reading: UILabel!
    @IBOutlet weak var Writing: UILabel!
    @IBOutlet weak var Math: UILabel!
    @IBOutlet weak var criticalAveScore: UILabel!
    
    // MARK: - Properties
    
    var dbnPlaceHolder = ""
    var namePlaceHolder = ""
    var dataSession: DataFetching!  // To be injected
    var satScore: SATScore?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                try await fetchData()
            } catch {
                print("Failed to fetch SAT scores: \(error.localizedDescription)")
            }
        }
    }
    
    // Asynchronously fetch SAT scores and update the UI
    func fetchData() async throws {
        // Fetching high school data using the defined endpoint
        await dataSession.fetchHighSchoolData(url: Endpoints.highSchoolsURL)

        // Retrieving the SAT score for a specific school based on the provided DBN
        if let sat = dataSession.getOneSchoolSat(dbn: self.dbnPlaceHolder) {
            // Updating the UI on the main thread
            DispatchQueue.main.async {
                self.updateUI(with: sat)
            }
        }
    }
    
    // Update the UI with the provided SAT score
    func updateUI(with satScore: SATScore) {
        self.Math.text = satScore.satMathAvgScore
        self.Reading.text = satScore.satCriticalReadingAvgScore
        self.Writing.text = satScore.satWritingAvgScore
        self.criticalAveScore.text = satScore.satCriticalReadingAvgScore
    }
}

