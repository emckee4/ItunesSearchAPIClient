//
//  MultiPageTypedResults.swift
//  
//
//  Created by Evan Mckee on 5/1/20.
//

import Foundation
import Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public class MultiPageTypedResults<T:ResultItem>:ObservableObject {
    
    unowned let client:ItunesSearchClient
    let baseQuery:ItunesSearchRequest
    @Published public var results:[T] = []
    @Published public var status: MultiPageStatus
    @Published public var error: ItunesSearchError?
    var subscriptions:Set<AnyCancellable> = []
    

    public func fetch() {
        guard case let .ready(offset) = status else {
            return
        }
        if self.error != nil {
            // no need to repeatedly republish no error
            self.error = nil
        }
        self.status = .loading(offset: offset)
        var updatedQuery = baseQuery
        updatedQuery.offset = offset
        client.typedSearchPublisher(request: updatedQuery, resultType: T.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
            if case let .failure(error) = completion {
                self.status = .ready(nextOffset: offset)
                self.error = error
            }
        }) { (resultPage) in
            self.results += resultPage.results
            if resultPage.resultCount < updatedQuery.limit {
                self.status = .complete
            } else {
                self.status = .ready(nextOffset: offset + updatedQuery.limit)
            }
        }.store(in: &subscriptions)
    }
    public init(client:ItunesSearchClient, baseRequest:ItunesSearchRequest) {
        self.client = client
        self.baseQuery = baseRequest
        self.status = .ready(nextOffset: 0)
    }
}
