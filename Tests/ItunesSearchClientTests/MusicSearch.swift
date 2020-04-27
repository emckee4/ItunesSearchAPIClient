//
//  MusicSearch.swift
//
//
//  Created by Evan Mckee on 3/12/20.
//

import XCTest
import Combine
@testable import ItunesSearchClient

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class MusicSearch: NetworkedTests {

    func testMusic_track_songTerm_history() {
        let params:ItunesSearchParameters = .music(entity: .musicTrack, attribute: .songTerm)
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
                XCTAssert(output.results.reduce(true) {$0 && ($1 is SongTrackResultItem || $1 is MusicVideoTrackResultItem)})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }

    func testMusic_song_songTerm_history() {
        let params:ItunesSearchParameters = .music(entity: .song, attribute: .songTerm)
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
                    XCTAssert(output.results.reduce(true) {$0 && $1 is SongTrackResultItem})
            }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    
    func testMusic_album_albumTerm_history() {
        let params:ItunesSearchParameters = .music(entity: .album, attribute: .albumTerm)
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
                    XCTAssert(output.results.reduce(true) {$0 && ($1 is MusicCollectionResultItem || $1 is CompilationResultItem)})
            }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
// NOTE: The api doesn't seem to accept any attributes with the mix enitity (it 404s) and mix returns nothing I've found
//    func testMusic_mix_mixTerm_history() {
//        let params:ItunesSearchParameters = .music(entity: .mix, attribute: .mixTerm)
//        let pathDescription = "\(params)"
//        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
//        let request = ItunesSearchRequest(term: "history", searchParameters: params)
//        searchClient.performSearch(request: request, verbose:true)
//            .sink(receiveCompletion: { (result) in
//                if case let .failure(error) = result {
//                    XCTFail("Failure with error: \(error)")
//                }
//                testExpectation.fulfill()
//            }) { (output) in
//                XCTAssert(output.results.count > 0)
//                var types:Set<String> = []
//                for item in output.results {
//                    types.insert("\(type(of: item))")
//                }
//                //XCTAssert(output.results.reduce(true) {$0 && $1 is ArtistResultItem})
//        }
//        .store(in: &subscriptions)
//        wait(for: [testExpectation], timeout: 4)
//    }

    static var allTests:[(String, (MusicSearch) -> () -> ())] = [
        ("testMusic_track_songTerm_history", testMusic_track_songTerm_history),
        ("testMusic_song_songTerm_history", testMusic_song_songTerm_history),
        ("testMusic_album_albumTerm_history", testMusic_album_albumTerm_history),
    ]
}


