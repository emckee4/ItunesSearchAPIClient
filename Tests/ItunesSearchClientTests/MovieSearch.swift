//
//  MovieSearch.swift
//  
//
//  Created by Evan Mckee on 3/11/20.
//

import XCTest
import Combine
@testable import ItunesSearchClient

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class MovieSearch: NetworkedTests {

    func testMovie_movie_featureFilmTerm_history() {
        let params:ItunesSearchParameters = .movie(entity: .movie, attribute: .featureFilmTerm)
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
                XCTAssert(output.results.reduce(true) {$0 && $1 is FeatureMovieTrackResultItem})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }

    func testMovie_movie_movieTerm_history() {
        let params:ItunesSearchParameters = .movie(entity: .movie, attribute: .movieTerm)
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
                XCTAssert(output.results.reduce(true) {$0 && $1 is FeatureMovieTrackResultItem})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }

    func testMovie_movie_directorTerm_duncan() {
        let params:ItunesSearchParameters = .movie(entity: .movie, attribute: .directorTerm)
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
                XCTAssert(output.results.reduce(true) {$0 && $1 is FeatureMovieTrackResultItem})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    
    func testMovie_movieArtist_artistTerm_duncan() {
        let params:ItunesSearchParameters = .movie(entity: .movieArtist, attribute: .artistTerm)
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
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    
    func testMovieTypedSearch_movieArtist_artistTerm_duncan() {
        let params:ItunesSearchParameters = .movie(entity: .movieArtist, attribute: .artistTerm)
        let pathDescription = "\(params)"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesSearchRequest(term: "duncan", searchParameters: params)
        searchClient.typedSearchPublisher(request: request, resultType: ArtistResultItem.self)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.count > 0)
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    
    
    static var allTests = [
        ("testMovie_movie_featureFilmTerm_history", testMovie_movie_featureFilmTerm_history),
        ("testMovie_movie_movieTerm_history", testMovie_movie_movieTerm_history),
        ("testMovie_movie_directorTerm_duncan", testMovie_movie_directorTerm_duncan),
        ("testMovie_movieArtist_artistTerm_duncan", testMovie_movieArtist_artistTerm_duncan),
        ("testMovieTypedSearch_movieArtist_artistTerm_duncan", testMovieTypedSearch_movieArtist_artistTerm_duncan)
    ]
}


