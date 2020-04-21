//
//  File.swift
//  
//
//  Created by Evan Mckee on 4/6/20.
//

import XCTest
@testable import ItunesSearchClient

class LegacySearchTests: XCTestCase {

    var searchClient:ItunesSearchClient!
    
    override func setUp() {
        super.setUp()
        searchClient = ItunesSearchClient()
        searchClient.session = URLSession(configuration: .default)
    }
    

    func testLegacyPodcast_podcast_descriptionTerm_history() {
        let params:ItunesSearchParameters = .podcast(entity: .podcast, attribute: .descriptionTerm)
        let pathDescription = "\(params)"
        let testExpectation = self.expectation(description:  "Expectation for: Closure-based " + pathDescription)
        let request = ItunesSearchRequest(term: "history", searchParameters: params)
        searchClient.performSearch(request: request, completion: { (output) in
            switch output {
            case .failure(let error):
                XCTFail("Failure with error: \(error)")
            case .success(let result):
                XCTAssert(result.results.count > 0)
                XCTAssert(result.results.reduce(true) {$0 && $1 is PodcastResultItem})
            }
            testExpectation.fulfill()
        })
        wait(for: [testExpectation], timeout: 4)
    }
    
func testLegacyTypedPodcast_podcast_descriptionTerm_history() {
    let params:ItunesSearchParameters = .podcast(entity: .podcast, attribute: .descriptionTerm)
    let pathDescription = "\(params)"
    let testExpectation = self.expectation(description:  "Expectation for: Closure-based " + pathDescription)
    let request = ItunesSearchRequest(term: "history", searchParameters: params)
    searchClient.performTypedSearch(request: request, resultType:PodcastResultItem.self, completion: { (output) in
        switch output {
        case .failure(let error):
            XCTFail("Failure with error: \(error)")
        case .success(let result):
            XCTAssert(result.results.count > 0)
        }
        testExpectation.fulfill()
    })
    wait(for: [testExpectation], timeout: 4)
}
    

    static var allTests = [
        ("testLegacyPodcast_podcast_descriptionTerm_history", testLegacyPodcast_podcast_descriptionTerm_history),
        ("testLegacyTypedPodcast_podcast_descriptionTerm_history", testLegacyTypedPodcast_podcast_descriptionTerm_history)
    ]
}
