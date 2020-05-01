//
//  SoftwareSearch.swift
//
//
//  Created by Evan Mckee on 3/12/20.
//

import XCTest
import Combine
@testable import ItunesSearchClient

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class SoftwareSearch: NetworkedTests {
    
    func testSoftware_software_softwareDeveloper_mckee() {
        let params:ItunesSearchParameters = .software(entity: .software, attribute: .softwareDeveloper)
        let pathDescription = "\(params)"
        let testExpectation = self.expectation(description:  "Expectation for: " + pathDescription)
        let request = ItunesSearchRequest(term: "mckee", searchParameters: params)
        searchClient.searchPublisherWithDiagnostics(request: request)
            .sink(receiveCompletion: { (result) in
                if case let .failure(error) = result {
                    XCTFail("Failure with error: \(error)")
                }
                testExpectation.fulfill()
            }) { (output) in
                XCTAssert(output.results.count > 0)
                XCTAssert(output.results.reduce(true) {$0 && ($1 is SoftwareResultItem)})
        }
        .store(in: &subscriptions)
        wait(for: [testExpectation], timeout: 4)
    }

    static var allTests:[(String, (SoftwareSearch) -> () -> ())] = [
        ("testSoftware_software_softwareDeveloper_mckee", testSoftware_software_softwareDeveloper_mckee),
    ]
}


