//
//  ItunesResultKind.swift
//  
//
//  Created by Evan Mckee on 4/6/20.
//

import Foundation

public enum ItunesResultKind:Decodable, RawRepresentable {

    
    case podcast
    case movie
    case feature_movie
    case tv_episode
    case song
    case music_video
    
    case book
    case album
    case coached_audio
    case interactive_booklet
    case pdf
    case podcast_episode
    case software_package
    case artist
    case other(String)

    
    public var rawValue:String {
        switch self {
        case .podcast: return "podcast"
        case .movie: return "movie"
        case .feature_movie: return "feature-movie"
        case .tv_episode: return "tv-episode"
        case .song: return "song"
        case .music_video: return "music-video"
        case .book: return "book"
        case .album: return "album"
        case .coached_audio: return "coached_audio"
        case .interactive_booklet: return "interactive_booklet"
        case .pdf: return "pdf"
        case .podcast_episode: return "podcast_episode"
        case .software_package: return "software_package"
        case .artist: return "artist"
        case .other(let str): return str
        }
    }
    
    public init?(rawValue: String) {
        switch rawValue {
        case "podcast": self = .podcast
        case "movie": self = .movie
        case "feature-movie": self = .feature_movie
        case "tv-episode": self = .tv_episode
        case "song": self = .song
        case "music-video": self = .music_video

        case "book": self = .book
        case "album": self = .album
        case "coached-audio": self = .coached_audio
        case "interactive-booklet": self = .interactive_booklet
        case "pdf": self = .pdf
        case "podcast-episode": self = .podcast_episode
        case "software-package": self = .software_package
        case "artist": self = .artist
            
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
