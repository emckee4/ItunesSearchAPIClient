//
//  ItunesWrapperType.swift
//  
//
//  Created by Evan Mckee on 3/31/20.
//

import Foundation

public enum ItunesWrapperType:RawRepresentable, Decodable, CustomStringConvertible {
    public typealias RawValue = String
    case track
    case collection
    case software
    case artist
    case audiobook
    case other(name:String)
    case none
    
    
    public init(from decoder: Decoder) throws {
        do {
            let val = try decoder.singleValueContainer().decode(String.self)
            self = Self.init(rawValue: val) ?? .none
        } catch DecodingError.typeMismatch {
            self = .none
        } catch {
            throw error
        }
    }
    
    public var rawValue: String {
        switch self {
        case .track: return "track"
        case .collection: return "collection"
        case .software: return "software"
        case .artist: return "artist"
        case .audiobook: return "audiobook"
        case .other(let name): return name
        case .none: return ""
        }
    }
    public init?(rawValue: Self.RawValue) {
        switch rawValue {
        case "track": self = .track
        case "collection": self = .collection
        case "software": self = .software
        case "artist": self = .artist
        case "audiobook": self = .audiobook
        case "": self = .none
        default:
            self = .other(name: rawValue); print("\nWrapperType.other: \(rawValue)\n")
        }
    }
    
    public var description: String {
        return rawValue
    }
}
