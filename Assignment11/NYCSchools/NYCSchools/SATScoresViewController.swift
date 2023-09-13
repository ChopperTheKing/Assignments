//
//  SATScoresViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation
import UIKit

class SATScoresViewController: UIViewController {
    
    @IBOutlet weak var Reading: UILabel!
    //@IBOutlet weak var Reading: UILabel!
    @IBOutlet weak var Writing: UILabel!
    // MARK: - Outlets
    @IBOutlet weak var Math: UILabel!
    @IBOutlet weak var criticalAveScore: UILabel!

    
    var dbnPlaceHolder = ""
    var namePlaceHolder = ""
   var dataSession = DataSession()
    
    // MARK: - Properties
    var satScore: SATScore?
     
  //  var service = fetchHighSchools()
    
    // An enum to represent the different SAT sections and retrieve the appropriate scores
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            
            await dataSession.fetchHighSchoolData(url: dataSession.highSchoolsURL)
            let sat =   await dataSession.getOneSchoolSat(dbn:self.dbnPlaceHolder)
            DispatchQueue.main.async {
                self.Math.text = sat?.satMathAvgScore
                self.Reading.text = sat?.satCriticalReadingAvgScore
                self.Writing.text = sat?.satWritingAvgScore
                self.criticalAveScore.text = sat?.satCriticalReadingAvgScore
            }
            
        }
    }
    
    // MARK: - Lifecycle Methods
    
//
//    // MARK: - Setup Methods
//    private func setupTableView() {
//        tableView.dataSource = self
//        tableView.register(ScoreCell.self, forCellReuseIdentifier: "ScoreCell")
//    }
}

// MARK: - UITableViewDataSource

