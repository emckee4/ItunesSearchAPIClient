//
//  ItunesCollectionType.swift
//  
//
//  Created by Evan Mckee on 4/6/20.
//

import Foundation


public enum ItunesCollectionType:Decodable, RawRepresentable {
    case Album
    case TVSeason
    
    case other(String)
    
    
    public var rawValue:String {
        switch self {
        case .Album: return "Album"
        case .TVSeason: return "TV Season"
        case .other(let str): return str
        }
    }
    
    public init?(rawValue: String) {
        switch rawValue {
        case "Album": self = .Album
        case "TV Season": self = .TVSeason
            
        default: self = .other(rawValue)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let svc = try decoder.singleValueContainer()
        let raw = try svc.decode(String.self)
        let val = Self.init(rawValue: raw)!
        self = val
    }
}
