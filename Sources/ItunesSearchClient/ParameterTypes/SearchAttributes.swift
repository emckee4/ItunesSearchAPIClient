//
//  File.swift
//  
//
//  Created by Evan Mckee on 1/1/20.
//

import Foundation

public protocol ItunesSearchAttributeType:ItunesQueryParameter{

}


public enum MovieAttribute: String, ItunesSearchAttributeType {
    case actorTerm, genreIndex, artistTerm, shortFilmTerm, producerTerm, ratingTerm, directorTerm, releaseYearTerm, featureFilmTerm, movieArtistTerm, movieTerm, ratingIndex, descriptionTerm
}

public enum PodcastAttribute: String, ItunesSearchAttributeType {
    case titleTerm, languageTerm, authorTerm, genreIndex, artistTerm, ratingIndex, keywordsTerm, descriptionTerm
}

public enum MusicAttribute: String, ItunesSearchAttributeType {
    case mixTerm, genreIndex, artistTerm, composerTerm, albumTerm, ratingIndex, songTerm
}

public enum MusicVideoAttribute: String, ItunesSearchAttributeType {
    case genreIndex, artistTerm, albumTerm, ratingIndex, songTerm
}

public enum AudiobookAttribute: String, ItunesSearchAttributeType {
    case titleTerm, authorTerm, genreIndex, ratingIndex
}

public enum ShortFilmAttribute: String, ItunesSearchAttributeType {
    case genreIndex, artistTerm, shortFilmTerm, ratingIndex, descriptionTerm
}

public enum TvShowAttribute: String, ItunesSearchAttributeType {
    case genreIndex, tvEpisodeTerm, showTerm, tvSeasonTerm, ratingIndex, descriptionTerm
}

public enum SoftwareAttribute: String, ItunesSearchAttributeType {
    case softwareDeveloper
}

//Note: There's no ebook Attribute enum because there doesn't seem to be one in the API.

public enum AllAttribute: String, ItunesSearchAttributeType {
    case actorTerm, languageTerm, allArtistTerm, tvEpisodeTerm, shortFilmTerm, directorTerm, releaseYearTerm, titleTerm, featureFilmTerm, ratingIndex, keywordsTerm, descriptionTerm, authorTerm, genreIndex, mixTerm, allTrackTerm, artistTerm, composerTerm, tvSeasonTerm, producerTerm, ratingTerm, songTerm, movieArtistTerm, showTerm, movieTerm, albumTerm
}
