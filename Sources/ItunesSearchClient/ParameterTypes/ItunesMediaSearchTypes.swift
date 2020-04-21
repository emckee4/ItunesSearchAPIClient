//
//  File.swift
//  
//
//  Created by Evan Mckee on 1/1/20.
//

import Foundation


/// These correspond to the case types of SearchParameters
public enum ItunesMediaSearchTypes: String, ItunesQueryParameter {
    case movie
    case podcast
    case music
    case musicVideo
    case audiobook
    case shortFilm
    case tvShow
    case software
    case ebook
    case all

    var entityTypesForMedia:[String]  {
        switch self {
        case .movie: return MovieEntity.allCases.map{$0.rawValue}
        case .podcast: return PodcastEntity.allCases.map{$0.rawValue}
        case .music: return MusicEntity.allCases.map{$0.rawValue}
        case .musicVideo: return MusicVideoEntity.allCases.map{$0.rawValue}
        case .audiobook: return AudiobookEntity.allCases.map{$0.rawValue}
        case .shortFilm: return ShortFilmEntity.allCases.map{$0.rawValue}
        case .tvShow: return TvShowEntity.allCases.map{$0.rawValue}
        case .software: return SoftwareEntity.allCases.map{$0.rawValue}
        case .ebook: return EbookEntity.allCases.map{$0.rawValue}
        case .all: return AllEntity.allCases.map{$0.rawValue}
        }
    }
    
    var attributeTypesForMedia:[String]? {
        switch self {
        case .movie: return MovieAttribute.allCases.map{$0.rawValue}
        case .podcast: return PodcastAttribute.allCases.map{$0.rawValue}
        case .music: return MusicAttribute.allCases.map{$0.rawValue}
        case .musicVideo: return MusicVideoAttribute.allCases.map{$0.rawValue}
        case .audiobook: return AudiobookAttribute.allCases.map{$0.rawValue}
        case .shortFilm: return ShortFilmAttribute.allCases.map{$0.rawValue}
        case .tvShow: return TvShowAttribute.allCases.map{$0.rawValue}
        case .software: return SoftwareAttribute.allCases.map{$0.rawValue}
        case .ebook: return nil
        case .all: return AllAttribute.allCases.map{$0.rawValue}
        }
    }
    
    
    func buildSearchParamsWith(rawEntity:String, rawAttribute:String?) -> ItunesSearchParameters? {
        switch self {
        case .movie:
            if let entity = MovieEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = MovieAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.movie(entity: entity, attribute: attribute)
            }
        case .podcast:
            if let entity = PodcastEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = PodcastAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.podcast(entity: entity, attribute: attribute)
            }
        case .music:
            if let entity = MusicEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = MusicAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.music(entity: entity, attribute: attribute)
            }
        case .musicVideo:
            if let entity = MusicVideoEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = MusicVideoAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.musicVideo(entity: entity, attribute: attribute)
            }
        case .audiobook:
            if let entity = AudiobookEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = AudiobookAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.audiobook(entity: entity, attribute: attribute)
            }
        case .shortFilm:
            if let entity = ShortFilmEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = ShortFilmAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.shortFilm(entity: entity, attribute: attribute)
            }
        case .tvShow:
            if let entity = TvShowEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = TvShowAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.tvShow(entity: entity, attribute: attribute)
            }
        case .software:
            if let entity = SoftwareEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = SoftwareAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.software(entity: entity, attribute: attribute)
            }
        case .ebook:
        if let entity = EbookEntity(rawValue: rawEntity) {
            return ItunesSearchParameters.ebook(entity: entity)
        }
        case .all:
            if let entity = AllEntity(rawValue: rawEntity),
                let rawAtt = rawAttribute,
                let attribute = AllAttribute(rawValue: rawAtt) {
                return ItunesSearchParameters.all(entity: entity, attribute: attribute)
            }
        }
        return nil
    }
}
