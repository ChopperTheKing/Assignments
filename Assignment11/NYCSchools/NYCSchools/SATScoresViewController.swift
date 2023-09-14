//
//  SATScoresViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation
import UIKit

// This class represents the view controller for displaying SAT scores.
class SATScoresViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var Reading: UILabel! // Outlet to display reading scores
    // Duplicate outlet commented out
    //@IBOutlet weak var Reading: UILabel!
    @IBOutlet weak var Writing: UILabel! // Outlet to display writing scores
    @IBOutlet weak var Math: UILabel! // Outlet to display math scores
    @IBOutlet weak var criticalAveScore: UILabel! // Outlet to display the average critical reading score
    
    // MARK: - Properties
    
    var dbnPlaceHolder = ""  // Placeholder to hold the DBN (District Borough Number) of a school
    var namePlaceHolder = "" // Placeholder to hold the name of a school
    var dataSession = DataSession() // An instance of the DataSession class for fetching data
    var satScore: SATScore?  // Optional property to hold the fetched SAT score for a school
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using the new Swift concurrency model to fetch and display SAT scores
        Task {
            // Fetching high school data
            await dataSession.fetchHighSchoolData(url: dataSession.highSchoolsURL)
            
            // Retrieving the SAT score for a specific school based on the provided DBN
            let sat = await dataSession.getOneSchoolSat(dbn: self.dbnPlaceHolder)
            
            // Updating the UI on the main thread
            DispatchQueue.main.async {
                self.Math.text = sat?.satMathAvgScore
                self.Reading.text = sat?.satCriticalReadingAvgScore
                self.Writing.text = sat?.satWritingAvgScore
                self.criticalAveScore.text = sat?.satCriticalReadingAvgScore
            }
        }
    }
    // private func setupTableView() {
    //     tableView.dataSource = self
    //     tableView.register(ScoreCell.self, forCellReuseIdentifier: "ScoreCell")
    // }
}
