//
//  DataModel.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

struct HighSchool: Decodable {
    let dbn: String
    let school_name: String
    var satScore: SATScore?
}

struct SATScore: Decodable {
    let dbn: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
}
