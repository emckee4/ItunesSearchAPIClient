//
//  Lookups.swift
//  
//
//  Created by Evan Mckee on 4/6/20.
//
// Many examples used from https://affiliate.itunes.apple.com/documentation/itunes-store-web-service-search-api/#lookup

import XCTest
import Combine
@testable import ItunesSearchClient

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class Lookups: NetworkedTests {

    ///    Look up Jack Johnson by iTunes artist ID:
    ///    https://itunes.apple.com/lookup?id=909253
    func testLookup_itunesId_jackJohnson() {
        let pathDescription = "testLookup_itunesId_jackJohnson"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesLookupRequest(idType:.itunes, ids: ["909253"])
        searchClient.searchPublisher(request: request)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.first is ArtistResultItem)
                let result = output.results.first as? ArtistResultItem
                XCTAssert(result?.artistName == "Jack Johnson")

        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    ///    Typed Look up Jack Johnson by iTunes artist ID:
    ///    https://itunes.apple.com/lookup?id=909253
    func testTypedLookup_itunesId_jackJohnson() {
        let pathDescription = "testTypedLookup_itunesId_jackJohnson"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesLookupRequest(idType:.itunes, ids: ["909253"])
        searchClient.typedSearchPublisher(request: request, resultType: ArtistResultItem.self)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.first?.artistName == "Jack Johnson")
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }

    
    ///     Look up Jack Johnson by AMG artist ID:
    /// https://itunes.apple.com/lookup?amgArtistId=468749
    func testLookup_amgArtistId_jackJohnson() {
        let pathDescription = "testLookup_amgArtistId_jackJohnson"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesLookupRequest(idType:.amgArtistId, ids: ["468749"])
        searchClient.searchPublisher(request: request)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.first is ArtistResultItem)
                let result = output.results.first as? ArtistResultItem
                XCTAssert(result?.artistName == "Jack Johnson")

        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    ///     Typed Look up Jack Johnson by AMG artist ID:
    /// https://itunes.apple.com/lookup?amgArtistId=468749
    func testTypedLookup_amgArtistId_jackJohnson() {
        let pathDescription = "testTypedLookup_amgArtistId_jackJohnson"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesLookupRequest(idType:.amgArtistId, ids: ["468749"])
        searchClient.typedSearchPublisher(request: request, resultType: ArtistResultItem.self)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.first?.artistName == "Jack Johnson")
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }

///    Look up multiple artists by their AMG artist IDs:
///    https://itunes.apple.com/lookup?amgArtistId=468749,5723
    func testLookupMultiple_amgArtistId() {
        let pathDescription = "testLookupMultiple_amgArtistId"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesLookupRequest(idType:.amgArtistId, ids: ["468749","5723"])
        searchClient.searchPublisher(request: request)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results is [ArtistResultItem])
                let results = output.results as? [ArtistResultItem]
                let names = results?.map(\.artistName)
                XCTAssert(names?.contains("Jack Johnson") == true)
                XCTAssert(names?.contains("U2") == true)
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    ///     Typed Look up Jack Johnson by AMG artist ID:
    /// https://itunes.apple.com/lookup?amgArtistId=468749
    func testTypedLookupMultiple_amgArtistId() {
        let pathDescription = "testTypedLookupMultiple_amgArtistId_jackJohnson"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesLookupRequest(idType:.amgArtistId, ids: ["468749","5723"])
        searchClient.typedSearchPublisher(request: request, resultType: ArtistResultItem.self)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                let names = output.results.map(\.artistName)
                XCTAssert(names.contains("Jack Johnson") == true)
                XCTAssert(names.contains("U2") == true)
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }
    

    /*
     Remaining TODO from https://affiliate.itunes.apple.com/documentation/itunes-store-web-service-search-api/#lookup
     
     Look up all albums for Jack Johnson:
     https://itunes.apple.com/lookup?id=909253&entity=album
     Look up multiple artists by their AMG artist IDs and get each artist’s top 5 albums:
     https://itunes.apple.com/lookup?amgArtistId=468749,5723&entity=album&limit=5
     Look up multiple artists by their AMG artist IDs and get each artist’s 5 most recent songs:
     https://itunes.apple.com/lookup?amgArtistId=468749,5723&entity=song&limit=5&sort=recent
     Look up an album or video by its UPC:
     https://itunes.apple.com/lookup?upc=720642462928
     Look up an album by its UPC, including the tracks on that album:
     https://itunes.apple.com/lookup?upc=720642462928&entity=song
     Look up an album by its AMG Album ID:
     https://itunes.apple.com/lookup?amgAlbumId=15175,15176,15177,15178,15183,15184,15187,1519,15191,15195,15197,15198
     Look up a Movie by AMG Video ID:
     https://itunes.apple.com/lookup?amgVideoId=17120
     Look up a book by its 13 digit ISBN:
     https://itunes.apple.com/lookup?isbn=9780316069359
     */
    
    
    

    static var allTests = [
        ("testLookup_itunesId_jackJohnson", testLookup_itunesId_jackJohnson),
        ("testTypedLookup_itunesId_jackJohnson", testTypedLookup_itunesId_jackJohnson),
        ("testLookup_amgArtistId_jackJohnson", testLookup_amgArtistId_jackJohnson),
        ("testTypedLookup_amgArtistId_jackJohnson", testTypedLookup_amgArtistId_jackJohnson),
        ("testLookupMultiple_amgArtistId", testLookupMultiple_amgArtistId),
        ("testTypedLookupMultiple_amgArtistId", testTypedLookupMultiple_amgArtistId),

    ]
}
