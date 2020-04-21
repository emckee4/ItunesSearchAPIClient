//
//  File.swift
//  
//
//  Created by Evan Mckee on 12/31/19.
//

import Foundation

public enum ItunesSearchParameters {
    case movie(entity:MovieEntity, attribute:MovieAttribute)
    case podcast(entity:PodcastEntity, attribute:PodcastAttribute)
    case music(entity:MusicEntity, attribute:MusicAttribute)
    case musicVideo(entity:MusicVideoEntity, attribute:MusicVideoAttribute)
    case audiobook(entity:AudiobookEntity, attribute:AudiobookAttribute)
    case shortFilm(entity:ShortFilmEntity, attribute:ShortFilmAttribute)
    case tvShow(entity:TvShowEntity, attribute:TvShowAttribute)
    case software(entity:SoftwareEntity, attribute:SoftwareAttribute)
    case ebook(entity:EbookEntity)
    case all(entity:AllEntity, attribute:AllAttribute)
    
    var stringTerms:(media:String, entity:String, attribute:String?) {
        switch self {
        case .movie(entity: let entity, attribute: let attribute):
            return (media:"movie", entity:entity.rawValue, attribute:attribute.rawValue)
        case .podcast(entity:let entity, attribute:let attribute):
            return (media:"podcast", entity:entity.rawValue, attribute:attribute.rawValue)
        case .music(entity:let entity, attribute: let attribute):
            return (media:"music", entity:entity.rawValue, attribute:attribute.rawValue)
        case .musicVideo(entity:let entity, attribute: let attribute):
            return (media:"musicVideo", entity:entity.rawValue, attribute:attribute.rawValue)
        case .audiobook(entity:let entity, attribute: let attribute):
            return (media:"audiobook", entity:entity.rawValue, attribute:attribute.rawValue)
        case .shortFilm(entity:let entity, attribute: let attribute):
            return (media:"shortFilm", entity:entity.rawValue, attribute:attribute.rawValue)
        case .tvShow(entity:let entity, attribute: let attribute):
            return (media:"tvShow", entity:entity.rawValue, attribute:attribute.rawValue)
        case .software(entity:let entity, attribute: let attribute):
            return (media:"software", entity:entity.rawValue, attribute:attribute.rawValue)
        case .ebook(entity:let entity):
            return (media:"ebook", entity:entity.rawValue, attribute:nil)
        case .all(entity:let entity, attribute: let attribute):
            return (media:"all", entity:entity.rawValue, attribute:attribute.rawValue)
        }
    }
    
}

extension ItunesSearchParameters: CustomStringConvertible {
    public var description: String {
        let terms = self.stringTerms
        return "Entity: \(terms.entity), Media: \(terms.media)" + (terms.attribute != nil ? ", Attribute: \(terms.attribute!)" : "")
    }
}
