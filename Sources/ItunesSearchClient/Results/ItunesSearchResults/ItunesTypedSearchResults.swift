//
//  ItunesTypedSearchResults.swift
//  
//
//  Created by Evan Mckee on 4/4/20.
//

import Foundation


///The typed search results will gracefully filter out all elements that do not decode to the expected type
public struct ItunesTypedSearchResults<T:ResultItem>:Decodable {
    public let results: [T]
    public let resultCount:Int
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ItunesSearchResultCodingKeys.self)
        self.resultCount = try values.decode(Int.self, forKey: .resultCount)
        let rawResults = try values.decode([OptionalDecodingWrapper<T>].self, forKey: .results)
        self.results = rawResults.compactMap(\.value)
    }
}


private struct OptionalDecodingWrapper<T:Decodable>:Decodable {
    let value:T?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let val = try? container.decode(T.self) {
            self.value = val
        } else {
            value = nil
        }
    }
}
