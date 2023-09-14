//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by Ronnie Kissos on 9/11/23.
//

import XCTest
@testable import NYCSchools

class SATScoresViewControllerTests: XCTestCase {

    var sut: SATScoresViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "satViewController") as? SATScoresViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFetchingSATData() {
        // Given
        sut.dbnPlaceHolder = "01M292"
        
        // When
        sut.viewDidLoad()
        
        // Wait for a while if needed, since the fetching is asynchronous
        let expectation = self.expectation(description: "FetchingData")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 6.0, handler: nil)
        
        // Then
        XCTAssertNotNil(sut.Math.text, "404")
        XCTAssertNotNil(sut.Reading.text, "355")
        XCTAssertNotNil(sut.Writing.text, "363")
        //XCTAssertNotNil(sut.criticalAveScore.text, "criticalAveScore label should have a value")
    }
}
