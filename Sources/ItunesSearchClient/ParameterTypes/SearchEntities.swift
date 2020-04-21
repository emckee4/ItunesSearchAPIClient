//
//  File.swift
//  
//
//  Created by Evan Mckee on 1/1/20.
//

import Foundation

public protocol ItunesSearchEntityType:ItunesQueryParameter {
    
}


public enum MovieEntity: String, ItunesSearchEntityType {
    case movieArtist, movie
}

public enum PodcastEntity: String, ItunesSearchEntityType {
    case podcastAuthor, podcast
}

public enum MusicEntity: String, ItunesSearchEntityType {
    //Please note that “musicTrack” can include both songs and music videos in the results
    case musicArtist, musicTrack, album, musicVideo, mix, song
    
}

public enum MusicVideoEntity: String, ItunesSearchEntityType {
    case musicArtist, musicVideo
}

public enum AudiobookEntity: String, ItunesSearchEntityType {
    case audiobookAuthor, audiobook
}

public enum ShortFilmEntity: String, ItunesSearchEntityType {
    case shortFilmArtist, shortFilm
}

public enum TvShowEntity: String, ItunesSearchEntityType {
    case tvEpisode, tvSeason
}

public enum SoftwareEntity: String, ItunesSearchEntityType {
    case software, iPadSoftware, macSoftware
}

public enum EbookEntity: String, ItunesSearchEntityType {
    case ebook
}

public enum AllEntity: String, ItunesSearchEntityType {
    case movie, album, allArtist, podcast, musicVideo, mix, audiobook, tvSeason, allTrack
}





