//
//  File.swift
//  
//
//  Created by Evan Mckee on 3/31/20.
//

import Foundation


public struct ItunesLookupRequest:ItunesRequest {
    
    public var idType:IDType
    public var ids:[String]
    public var entity:ItunesLookupEntities?
    public var sortRecent:Bool
    
    public var limit:Int = 50
    public var baseURL:URL = URL(string:"https://itunes.apple.com/")!
    public var additionalQueryItems:[URLQueryItem]?
    public var additionalHeaderFields:[String:String]?
    
//    ///The two-letter country code for the store you want to search. The search uses the default store front for the specified country. For example: US. The default is US.
    public var country: String? = "US"
    public var language: String?


    public init(idType:IDType, ids:[String], entity:ItunesLookupEntities? = nil, sortRecent:Bool = false) {
        self.idType = idType
        self.ids = ids
        self.entity = entity
        self.sortRecent = sortRecent
    }
    
    public func urlRequest() -> URLRequest {
        var comps = URLComponents(url: baseURL.appendingPathComponent("lookup"), resolvingAgainstBaseURL: false)!
        var queryItems = [
            URLQueryItem(name: self.idType.rawValue, value: self.ids.joined(separator: ",")),
            URLQueryItem(name: "limit", value: String(limit))
        ]
        if let entity = entity {
            queryItems.append(URLQueryItem(name: "entity", value: entity.rawValue))
        }
//        if let explicit = explicit {
//            queryItems.append(URLQueryItem(name: "explicit", value: explicit ? "Yes" : "No"))
//        }
        if let country = self.country {
            queryItems.append(URLQueryItem(name: "country", value: country))
        }
        if let lang = language {
            queryItems.append(URLQueryItem(name: "lang", value: lang))
        }
        queryItems += additionalQueryItems ?? []
        comps.queryItems = queryItems
        var req = URLRequest(url: comps.url!)
        if let headers = additionalHeaderFields {
            headers.forEach{req.addValue($0.value, forHTTPHeaderField: $0.key)}
        }
        return req
    }
    
    public enum IDType:String {
        ///iTunes id
        case itunes = "id"
        case upc
        case amgArtistId
        case amgAlbumId
        case amgVideoId
        case isbn
    }
    
}
/*
 Look up Jack Johnson by iTunes artist ID:
 https://itunes.apple.com/lookup?id=909253
 Look up Jack Johnson by AMG artist ID:
 https://itunes.apple.com/lookup?amgArtistId=468749
 Look up multiple artists by their AMG artist IDs:
 https://itunes.apple.com/lookup?amgArtistId=468749,5723
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
