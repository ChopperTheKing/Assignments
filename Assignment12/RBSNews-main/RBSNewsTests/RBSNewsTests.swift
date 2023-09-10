//
//  RBSNewsTests.swift
//  RBSNewsTests
//
//  RBS Tests Project on 12/10/20.
//

import XCTest
@testable import RBSNews

class NewsViewModelTests: XCTestCase {

    var viewModel: NewsViewModel! //unwrapped optional instance of the NewsViewModel that will be tested.

    override func setUp() {
        super.setUp()
        viewModel = NewsViewModel() //initializes the viewModel with a new instance of NewsViewModel.
    }

    func testFetchNews() {
        let expectation = self.expectation(description: "News fetched") //I expect this asynchronous code to complete within a certain time frame
        
        viewModel.fetchNews { result in //calls the fetchNews method on the viewModel
            switch result {
            case .success(let news):
                XCTAssertNotNil(news)
                XCTAssertNotNil(self.viewModel.articles) // If news is fetched successfully, it checks if the returned news + articles is not nil
            case .failure(let error):
                XCTFail("Fetching news failed with error: \(error)") //If there's an error while fetching the news, the test fails with an error message
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil) //The timeout is specified to prevent the test from hanging indefinitely
    }
}
