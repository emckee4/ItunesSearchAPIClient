//
//  File.swift
//  
//
//  Created by Evan Mckee on 11/12/19.
//

import Foundation

///https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/#searching
public struct ItunesSearchResults:Decodable {
    public let results: [ResultItem]
    public let resultCount: Int
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ItunesSearchResultCodingKeys.self)
        self.resultCount = try values.decode(Int.self, forKey: .resultCount)
        let vals = try values.decode([ResultDecodingWrapper].self, forKey: .results)
        self.results = vals.map{$0.content}
    }
    
}

enum ItunesSearchResultCodingKeys:String, CodingKey {
    case results, resultCount
}


