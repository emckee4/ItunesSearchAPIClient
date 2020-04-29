//
//  ResultDecodingWrapper.swift
//  
//
//  Created by Evan Mckee on 4/6/20.
//

import Foundation


struct ResultDecodingWrapper:Decodable {
    var content:ResultItem
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let wrapperType = try? values.decode(ItunesWrapperType.self, forKey: .wrapperType) {
            // use the container class associated with the type
            let kind:ItunesResultKind? = try? values.decode(ItunesResultKind.self, forKey: .kind)
            let collectionType:ItunesCollectionType? = try? values.decode(ItunesCollectionType.self, forKey: .collectionType)
            
            switch wrapperType {
            case .artist:
                self.content = try ArtistResultItem(from: decoder)
            case .track:
                switch kind {
                case .podcast:
                    self.content = try PodcastResultItem(from: decoder)
                case .movie:
                    self.content = try MovieTrackResultItem(from: decoder)
                case .feature_movie:
                    self.content = try FeatureMovieTrackResultItem(from:decoder)
                case .tv_episode:
                    self.content = try TVEpisodeTrackResultItem(from:decoder)
                case .song:
                    self.content = try SongTrackResultItem(from: decoder)
                case .music_video:
                    self.content = try MusicVideoTrackResultItem(from: decoder)
                default:
                    throw ItunesSearchResultErrors.unsupportedType(description:"wrapperType:\(wrapperType), kind:\(kind?.rawValue ?? "<no kind>")")
                }
            case .collection:
                switch collectionType {
                case .Album:
                    self.content = try MusicCollectionResultItem(from: decoder)
                case .TVSeason:
                    self.content = try TVSeasonCollectionResultItem(from: decoder)
                case .Compilation:
                    self.content = try CollectionResultItem(from: decoder)
                default:
                    throw ItunesSearchResultErrors.unsupportedType(description:"wrapperType:\(wrapperType), collectionType:\(collectionType?.rawValue ?? "<no collectionType>")")
                }
            case .software:
                self.content = try SoftwareResultItem(from: decoder)
            
            default:
                ///switch to a catch-all type once we have one
                throw ItunesSearchResultErrors.unsupportedType(description:"wrapperType:\(wrapperType), kind:\(kind?.rawValue ?? "<no kind>"), collectionType:\(collectionType?.rawValue ?? "<no collectionType>")")
            }
            

        } else {
            //use the general purpose results container
            throw ItunesSearchResultErrors.unsupportedType(description:"no type found")
        }
    }
    
    enum CodingKeys:String, CodingKey {
        case wrapperType
        case kind
        case collectionType
    }
}
