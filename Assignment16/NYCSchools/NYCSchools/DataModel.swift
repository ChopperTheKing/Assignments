//
//  DataModel.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation


// Defines a struct for representing High Schools
struct HighSchool: Decodable {

// Properties of the HighSchool struct with default values set to nil
  var dbn                            : String? = nil
  var schoolName                     : String? = nil
  var boro                           : String? = nil
  var overviewParagraph              : String? = nil
  var school10thSeats                : String? = nil
  var academicopportunities1         : String? = nil
  var academicopportunities2         : String? = nil
  var ellPrograms                    : String? = nil
  var neighborhood                   : String? = nil
  var buildingCode                   : String? = nil
  var location                       : String? = nil
  var phoneNumber                    : String? = nil
  var faxNumber                      : String? = nil
  var schoolEmail                    : String? = nil
  var website                        : String? = nil
  var subway                         : String? = nil
  var bus                            : String? = nil
  var grades2018                     : String? = nil
  var finalgrades                    : String? = nil
  var totalStudents                  : String? = nil
  var extracurricularActivities      : String? = nil
  var schoolSports                   : String? = nil
  var attendanceRate                 : String? = nil
  var pctStuEnoughVariety            : String? = nil
  var pctStuSafe                     : String? = nil
  var schoolAccessibilityDescription : String? = nil
  var directions1                    : String? = nil
  var requirement11                  : String? = nil
  var requirement21                  : String? = nil
  var requirement31                  : String? = nil
  var requirement41                  : String? = nil
  var requirement51                  : String? = nil
  var offerRate1                     : String? = nil
  var program1                       : String? = nil
  var code1                          : String? = nil
  var interest1                      : String? = nil
  var method1                        : String? = nil
  var seats9ge1                      : String? = nil
  var grade9gefilledflag1            : String? = nil
  var grade9geapplicants1            : String? = nil
  var seats9swd1                     : String? = nil
  var grade9swdfilledflag1           : String? = nil
  var grade9swdapplicants1           : String? = nil
  var seats101                       : String? = nil
  var admissionspriority11           : String? = nil
  var admissionspriority21           : String? = nil
  var admissionspriority31           : String? = nil
  var grade9geapplicantsperseat1     : String? = nil
  var grade9swdapplicantsperseat1    : String? = nil
  var primaryAddressLine1            : String? = nil
  var city                           : String? = nil
  var zip                            : String? = nil
  var stateCode                      : String? = nil
  var latitude                       : String? = nil
  var longitude                      : String? = nil
  var communityBoard                 : String? = nil
  var councilDistrict                : String? = nil
  var censusTract                    : String? = nil
  var bin                            : String? = nil
  var bbl                            : String? = nil
  var nta                            : String? = nil
  var borough                        : String? = nil

    // An enumeration that assists in the decoding of JSON keys into the appropriate struct properties
  enum CodingKeys: String, CodingKey {

    case dbn                            = "dbn"
    case schoolName                     = "school_name"
    case boro                           = "boro"
    case overviewParagraph              = "overview_paragraph"
    case school10thSeats                = "school_10th_seats"
    case academicopportunities1         = "academicopportunities1"
    case academicopportunities2         = "academicopportunities2"
    case ellPrograms                    = "ell_programs"
    case neighborhood                   = "neighborhood"
    case buildingCode                   = "building_code"
    case location                       = "location"
    case phoneNumber                    = "phone_number"
    case faxNumber                      = "fax_number"
    case schoolEmail                    = "school_email"
    case website                        = "website"
    case subway                         = "subway"
    case bus                            = "bus"
    case grades2018                     = "grades2018"
    case finalgrades                    = "finalgrades"
    case totalStudents                  = "total_students"
    case extracurricularActivities      = "extracurricular_activities"
    case schoolSports                   = "school_sports"
    case attendanceRate                 = "attendance_rate"
    case pctStuEnoughVariety            = "pct_stu_enough_variety"
    case pctStuSafe                     = "pct_stu_safe"
    case schoolAccessibilityDescription = "school_accessibility_description"
    case directions1                    = "directions1"
    case requirement11                  = "requirement1_1"
    case requirement21                  = "requirement2_1"
    case requirement31                  = "requirement3_1"
    case requirement41                  = "requirement4_1"
    case requirement51                  = "requirement5_1"
    case offerRate1                     = "offer_rate1"
    case program1                       = "program1"
    case code1                          = "code1"
    case interest1                      = "interest1"
    case method1                        = "method1"
    case seats9ge1                      = "seats9ge1"
    case grade9gefilledflag1            = "grade9gefilledflag1"
    case grade9geapplicants1            = "grade9geapplicants1"
    case seats9swd1                     = "seats9swd1"
    case grade9swdfilledflag1           = "grade9swdfilledflag1"
    case grade9swdapplicants1           = "grade9swdapplicants1"
    case seats101                       = "seats101"
    case admissionspriority11           = "admissionspriority11"
    case admissionspriority21           = "admissionspriority21"
    case admissionspriority31           = "admissionspriority31"
    case grade9geapplicantsperseat1     = "grade9geapplicantsperseat1"
    case grade9swdapplicantsperseat1    = "grade9swdapplicantsperseat1"
    case primaryAddressLine1            = "primary_address_line_1"
    case city                           = "city"
    case zip                            = "zip"
    case stateCode                      = "state_code"
    case latitude                       = "latitude"
    case longitude                      = "longitude"
    case communityBoard                 = "community_board"
    case councilDistrict                = "council_district"
    case censusTract                    = "census_tract"
    case bin                            = "bin"
    case bbl                            = "bbl"
    case nta                            = "nta"
    case borough                        = "borough"
  
  }

    // Initializer that takes a `Decoder` and decodes the respective JSON keys to the struct's properties
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    dbn                            = try values.decodeIfPresent(String.self , forKey: .dbn                            )
    schoolName                     = try values.decodeIfPresent(String.self , forKey: .schoolName                     )
    boro                           = try values.decodeIfPresent(String.self , forKey: .boro                           )
    overviewParagraph              = try values.decodeIfPresent(String.self , forKey: .overviewParagraph              )
    school10thSeats                = try values.decodeIfPresent(String.self , forKey: .school10thSeats                )
    academicopportunities1         = try values.decodeIfPresent(String.self , forKey: .academicopportunities1         )
    academicopportunities2         = try values.decodeIfPresent(String.self , forKey: .academicopportunities2         )
    ellPrograms                    = try values.decodeIfPresent(String.self , forKey: .ellPrograms                    )
    neighborhood                   = try values.decodeIfPresent(String.self , forKey: .neighborhood                   )
    buildingCode                   = try values.decodeIfPresent(String.self , forKey: .buildingCode                   )
    location                       = try values.decodeIfPresent(String.self , forKey: .location                       )
    phoneNumber                    = try values.decodeIfPresent(String.self , forKey: .phoneNumber                    )
    faxNumber                      = try values.decodeIfPresent(String.self , forKey: .faxNumber                      )
    schoolEmail                    = try values.decodeIfPresent(String.self , forKey: .schoolEmail                    )
    website                        = try values.decodeIfPresent(String.self , forKey: .website                        )
    subway                         = try values.decodeIfPresent(String.self , forKey: .subway                         )
    bus                            = try values.decodeIfPresent(String.self , forKey: .bus                            )
    grades2018                     = try values.decodeIfPresent(String.self , forKey: .grades2018                     )
    finalgrades                    = try values.decodeIfPresent(String.self , forKey: .finalgrades                    )
    totalStudents                  = try values.decodeIfPresent(String.self , forKey: .totalStudents                  )
    extracurricularActivities      = try values.decodeIfPresent(String.self , forKey: .extracurricularActivities      )
    schoolSports                   = try values.decodeIfPresent(String.self , forKey: .schoolSports                   )
    attendanceRate                 = try values.decodeIfPresent(String.self , forKey: .attendanceRate                 )
    pctStuEnoughVariety            = try values.decodeIfPresent(String.self , forKey: .pctStuEnoughVariety            )
    pctStuSafe                     = try values.decodeIfPresent(String.self , forKey: .pctStuSafe                     )
    schoolAccessibilityDescription = try values.decodeIfPresent(String.self , forKey: .schoolAccessibilityDescription )
    directions1                    = try values.decodeIfPresent(String.self , forKey: .directions1                    )
    requirement11                  = try values.decodeIfPresent(String.self , forKey: .requirement11                  )
    requirement21                  = try values.decodeIfPresent(String.self , forKey: .requirement21                  )
    requirement31                  = try values.decodeIfPresent(String.self , forKey: .requirement31                  )
    requirement41                  = try values.decodeIfPresent(String.self , forKey: .requirement41                  )
    requirement51                  = try values.decodeIfPresent(String.self , forKey: .requirement51                  )
    offerRate1                     = try values.decodeIfPresent(String.self , forKey: .offerRate1                     )
    program1                       = try values.decodeIfPresent(String.self , forKey: .program1                       )
    code1                          = try values.decodeIfPresent(String.self , forKey: .code1                          )
    interest1                      = try values.decodeIfPresent(String.self , forKey: .interest1                      )
    method1                        = try values.decodeIfPresent(String.self , forKey: .method1                        )
    seats9ge1                      = try values.decodeIfPresent(String.self , forKey: .seats9ge1                      )
    grade9gefilledflag1            = try values.decodeIfPresent(String.self , forKey: .grade9gefilledflag1            )
    grade9geapplicants1            = try values.decodeIfPresent(String.self , forKey: .grade9geapplicants1            )
    seats9swd1                     = try values.decodeIfPresent(String.self , forKey: .seats9swd1                     )
    grade9swdfilledflag1           = try values.decodeIfPresent(String.self , forKey: .grade9swdfilledflag1           )
    grade9swdapplicants1           = try values.decodeIfPresent(String.self , forKey: .grade9swdapplicants1           )
    seats101                       = try values.decodeIfPresent(String.self , forKey: .seats101                       )
    admissionspriority11           = try values.decodeIfPresent(String.self , forKey: .admissionspriority11           )
    admissionspriority21           = try values.decodeIfPresent(String.self , forKey: .admissionspriority21           )
    admissionspriority31           = try values.decodeIfPresent(String.self , forKey: .admissionspriority31           )
    grade9geapplicantsperseat1     = try values.decodeIfPresent(String.self , forKey: .grade9geapplicantsperseat1     )
    grade9swdapplicantsperseat1    = try values.decodeIfPresent(String.self , forKey: .grade9swdapplicantsperseat1    )
    primaryAddressLine1            = try values.decodeIfPresent(String.self , forKey: .primaryAddressLine1            )
    city                           = try values.decodeIfPresent(String.self , forKey: .city                           )
    zip                            = try values.decodeIfPresent(String.self , forKey: .zip                            )
    stateCode                      = try values.decodeIfPresent(String.self , forKey: .stateCode                      )
    latitude                       = try values.decodeIfPresent(String.self , forKey: .latitude                       )
    longitude                      = try values.decodeIfPresent(String.self , forKey: .longitude                      )
    communityBoard                 = try values.decodeIfPresent(String.self , forKey: .communityBoard                 )
    councilDistrict                = try values.decodeIfPresent(String.self , forKey: .councilDistrict                )
    censusTract                    = try values.decodeIfPresent(String.self , forKey: .censusTract                    )
    bin                            = try values.decodeIfPresent(String.self , forKey: .bin                            )
    bbl                            = try values.decodeIfPresent(String.self , forKey: .bbl                            )
    nta                            = try values.decodeIfPresent(String.self , forKey: .nta                            )
    borough                        = try values.decodeIfPresent(String.self , forKey: .borough                        )
 
  }
    // A default initializer for the struct
  init() {

  }

}


// Defines a struct to represent SAT scores of a school
struct SATScore: Decodable { // Conforms to the Decodable protocol for easy decoding from JSON or similar data sources.

  // MARK: - Properties

  // Identifier for the school, usually a unique value
  var dbn: String? = nil
  var schoolName: String? = nil
  var numOfSatTestTakers: String? = nil
  var satCriticalReadingAvgScore: String? = nil
  var satMathAvgScore: String? = nil
  var satWritingAvgScore: String? = nil

  // Enum defining the coding keys used during decoding.
  // This allows for mapping between the variable names in the struct and the keys in the encoded data.
  enum CodingKeys: String, CodingKey {

    // Mapping each property to its respective key in the encoded data
    case dbn = "dbn"
    case schoolName = "school_name"
    case numOfSatTestTakers = "num_of_sat_test_takers"
    case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
    case satMathAvgScore = "sat_math_avg_score"
    case satWritingAvgScore = "sat_writing_avg_score"
  
  }

  // Custom initializer that takes a decoder to initialize properties from the decoded data
  init(from decoder: Decoder) throws {

    // Create a decoding container using the defined coding keys
    let values = try decoder.container(keyedBy: CodingKeys.self)

    // Decode each property from the container if present
    dbn = try values.decodeIfPresent(String.self, forKey: .dbn)
    schoolName = try values.decodeIfPresent(String.self, forKey: .schoolName)
    numOfSatTestTakers = try values.decodeIfPresent(String.self, forKey: .numOfSatTestTakers)
    satCriticalReadingAvgScore = try values.decodeIfPresent(String.self, forKey: .satCriticalReadingAvgScore)
    satMathAvgScore = try values.decodeIfPresent(String.self, forKey: .satMathAvgScore)
    satWritingAvgScore = try values.decodeIfPresent(String.self, forKey: .satWritingAvgScore)
  }

  // Default initializer
  init() {
  }
}
