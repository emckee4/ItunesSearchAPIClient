//
//  File.swift
//
//
//  Created by Evan Mckee on 11/12/19.
//

import Foundation

public struct ItunesSearchRequest:ItunesRequest {

    public var term: String = ""
    ///The media type you want to search for. For example: movie. The default is all.
    public var media: String {
        return searchParameters.stringTerms.media
    }
    ///The type of results you want returned, relative to the specified media type. For example: movieArtist for a movie media type search. The default is the track entity associated with the specified media type.
    public var entity: String {
        return searchParameters.stringTerms.entity
    }
    ///The attribute you want to search for in the stores, relative to the specified media type. For example, if you want to search for an artist by name specify entity=allArtist&attribute=allArtistTerm. In this example, if you search for term=maroon, iTunes returns “Maroon 5” in the search results, instead of all artists who have ever recorded a song with the word “maroon” in the title. The default is all attributes associated with the specified media type.
    public var attribute: String? {
        return searchParameters.stringTerms.attribute
    }
    public var searchParameters:ItunesSearchParameters
    public var explicit: Bool?
    
    public var limit: Int = 50
    public var baseURL: URL = URL(string:"https://itunes.apple.com/")!
    ///The two-letter country code for the store you want to search. The search uses the default store front for the specified country. For example: US. The default is US.
    public var country: String? = "US"
    public var language: String?
    public var additionalQueryItems:[URLQueryItem]?
    public var additionalHeaderFields:[String:String]?
    
    public var offset:Int?
    
    public init(term:String, searchParameters:ItunesSearchParameters, explicit:Bool? = nil, limit:Int = 50, offset:Int? = nil) {
        self.term = term
        self.searchParameters = searchParameters
        self.explicit = explicit
        self.limit = limit
        self.offset = offset
    }
    
    public func urlRequest() -> URLRequest {
        var comps = URLComponents(url: baseURL.appendingPathComponent("search"), resolvingAgainstBaseURL: false)!
        var queryItems = [
            URLQueryItem(name: "term", value: term),
            URLQueryItem(name: "media", value: media),
            URLQueryItem(name: "entity", value: entity),
            URLQueryItem(name: "limit", value: String(limit))
        ]
        if let offset = self.offset {
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        }
        if let country = self.country {
            queryItems.append(URLQueryItem(name: "country", value: country))
        }
        if let lang = language {
            queryItems.append(URLQueryItem(name: "lang", value: lang))
        }
        if let attr = attribute {
            queryItems.append(URLQueryItem(name: "attribute", value: attr))
        }
        if let explicit = explicit {
            queryItems.append(URLQueryItem(name: "explicit", value: explicit ? "Yes" : "No"))
        }
        queryItems += additionalQueryItems ?? []
        comps.queryItems = queryItems
        var req = URLRequest(url: comps.url!)
        if let headers = additionalHeaderFields {
            headers.forEach{req.addValue($0.value, forHTTPHeaderField: $0.key)}
        }
        return req
    }
}

