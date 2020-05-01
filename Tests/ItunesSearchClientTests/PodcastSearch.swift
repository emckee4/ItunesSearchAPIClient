//
//  PodcastSearch.swift
//  
//
//  Created by Evan Mckee on 3/11/20.
//

import XCTest
import Combine
@testable import ItunesSearchClient

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class PodcastSearch: NetworkedTests {
    
    func testPodcast_podcast_descriptionTerm_history() {
        let params:ItunesSearchParameters = .podcast(entity: .podcast, attribute: .descriptionTerm)
        let pathDescription = "\(params)"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesSearchRequest(term: "history", searchParameters: params)
        searchClient.searchPublisherWithDiagnostics(request: request)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.count > 0)
                XCTAssert(output.results.reduce(true) {$0 && $1 is PodcastResultItem})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    
    func testPodcast_podcastAuthor_descriptionTerm_duncan() {
        let params:ItunesSearchParameters = .podcast(entity: .podcastAuthor, attribute: .descriptionTerm)
        let pathDescription = "\(params)"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesSearchRequest(term: "duncan", searchParameters: params)
        searchClient.searchPublisherWithDiagnostics(request: request)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.count > 0)
                XCTAssert(output.results.reduce(true) {$0 && $1 is ArtistResultItem})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    

    static var allTests = [
        ("testPodcast_podcast_descriptionTerm_history", testPodcast_podcast_descriptionTerm_history),
        ("testPodcast_podcastAuthor_descriptionTerm_duncan", testPodcast_podcastAuthor_descriptionTerm_duncan)
    ]
}


