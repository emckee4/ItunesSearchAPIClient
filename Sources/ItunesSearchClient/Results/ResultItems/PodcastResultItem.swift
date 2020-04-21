//
//  File.swift
//  
//
//  Created by Evan Mckee on 11/13/19.
//

import Foundation

public struct PodcastResultItem:TrackResultItem {
    
    public let artworkUrl600: URL?
    public let collectionCensoredName: String
    public let collectionHdPrice: Decimal
    public let collectionId: Int
    public let collectionName: String
    public let collectionViewUrl: URL
    public let feedUrl: URL?
    public let genreIds: [String]
    public let genres: [String]
    public let trackCount: Int
    public let trackHdPrice: Decimal
    public let trackHdRentalPrice: Decimal
    public let trackRentalPrice: Decimal
    
    //track result items
    public let artistId: Int?
    public let artistName: String
    public let artistViewUrl: URL?
    public let artworkUrl100: URL?
    public let artworkUrl30: URL?
    public let artworkUrl60: URL?
    public let collectionExplicitness: String?
    public let collectionPrice: Decimal?
    public let contentAdvisoryRating: String?
    public let country: String?
    public let currency: String?
    public let kind: ItunesResultKind
    public let primaryGenreName: String?
    public let releaseDate: Date?
    public let trackCensoredName: String?
    public let trackExplicitness: String?
    public let trackId: Int?
    public let trackName: String?
    public let trackPrice: Decimal?
    public let trackViewUrl: URL?
    public let wrapperType: ItunesWrapperType

    

    public enum PodcastCodingKeys:String, CodingKey {
        case artworkUrl600, collectionCensoredName, collectionHdPrice, collectionId, collectionName, collectionViewUrl, feedUrl, genreIds, genres, trackCount, trackHdPrice, trackHdRentalPrice, trackRentalPrice
    }


    public init(from decoder: Decoder) throws {
        let trackValues = try decoder.container(keyedBy: TrackResultCodingKeys.self)
        self.artistId = try trackValues.decodeIfPresent(Int.self, forKey: .artistId)
        self.artistName = try trackValues.decode(String.self, forKey: .artistName)
        self.artistViewUrl = try trackValues.decodeIfPresent(URL.self, forKey: .artistViewUrl)
        self.artworkUrl100 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl100)
        self.artworkUrl30 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl30)
        self.artworkUrl60 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl60)
        self.collectionExplicitness = try trackValues.decode(String.self, forKey: .collectionExplicitness)
        self.collectionPrice = try trackValues.decode(Decimal.self, forKey: .collectionPrice)
        self.contentAdvisoryRating = try trackValues.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
        self.country = try trackValues.decode(String.self, forKey: .country)
        self.currency = try trackValues.decode(String.self, forKey: .currency)
        self.kind = try trackValues.decode(ItunesResultKind.self, forKey: .kind)
        self.primaryGenreName = try trackValues.decode(String.self, forKey: .primaryGenreName)
        let releaseDateString = try trackValues.decode(String.self, forKey: .releaseDate)
        self.releaseDate = ISO8601DateFormatter.default.date(from: releaseDateString)!
       
        self.trackCensoredName = try trackValues.decode(String.self, forKey: .trackCensoredName)
        self.trackExplicitness = try trackValues.decode(String.self, forKey: .trackExplicitness)
        self.trackId = try trackValues.decode(Int.self, forKey: .trackId)
        self.trackName = try trackValues.decode(String.self, forKey: .trackName)
        self.trackPrice = try trackValues.decode(Decimal.self, forKey: .trackPrice)
        self.trackViewUrl = try trackValues.decode(URL.self, forKey: .trackViewUrl)
        self.wrapperType = try trackValues.decode(ItunesWrapperType.self, forKey: .wrapperType)
        
        let values = try decoder.container(keyedBy: PodcastCodingKeys.self)
        self.artworkUrl600 = try values.decodeIfPresent(URL.self, forKey: .artworkUrl600)
        self.collectionCensoredName = try values.decode(String.self, forKey: .collectionCensoredName)
        self.collectionHdPrice = try values.decode(Decimal.self, forKey: .collectionHdPrice)
        self.collectionId = try values.decode(Int.self, forKey: .collectionId)
        self.collectionName = try values.decode(String.self, forKey: .collectionName)
        self.collectionViewUrl = try values.decode(URL.self, forKey: .collectionViewUrl)
        self.feedUrl = try values.decodeIfPresent(URL.self, forKey: .feedUrl)
        self.genreIds = try values.decode([String].self, forKey: .genreIds)
        self.genres = try values.decode([String].self, forKey: .genres)
        self.trackCount = try values.decode(Int.self, forKey: .trackCount)
        self.trackHdPrice = try values.decode(Decimal.self, forKey: .trackHdPrice)
        self.trackHdRentalPrice = try values.decode(Decimal.self, forKey: .trackHdRentalPrice)
        self.trackRentalPrice = try values.decode(Decimal.self, forKey: .trackRentalPrice)
    }

}

