//
//  TVShowSearch.swift
//  
//
//  Created by Evan Mckee on 3/12/20.
//

import XCTest
import Combine
@testable import ItunesSearchClient

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class TVShowSearch: NetworkedTests {
    
    func testTV_episode_tvEpisodeTerm_history() {
        let params:ItunesSearchParameters = .tvShow(entity: .tvEpisode, attribute: .tvEpisodeTerm)
        let pathDescription = "\(params)"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesSearchRequest(term: "history", searchParameters: params)
        searchClient.searchPublisher(request: request)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.count > 0)
                XCTAssert(output.results.reduce(true) {$0 && $1 is TVEpisodeTrackResultItem})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }

    func testTV_tvSeason_tvSeasonTerm_history() {
        let params:ItunesSearchParameters = .tvShow(entity: .tvSeason, attribute: .tvSeasonTerm)
        let pathDescription = "\(params)"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesSearchRequest(term: "history", searchParameters: params)
        searchClient.searchPublisher(request: request)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.count > 0)
                var types:Set<String> = []
                for item in output.results {
                    types.insert("\(type(of: item))")
                }
                //XCTAssert(output.results.reduce(true) {$0 && $1 is ArtistResultItem})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }

    static var allTests:[(String, (TVShowSearch) -> () -> ())] = [
        ("testTV_episode_tvEpisodeTerm_history", testTV_episode_tvEpisodeTerm_history),
        ("testTV_tvSeason_tvSeasonTerm_history", testTV_tvSeason_tvSeasonTerm_history),
    ]
}


