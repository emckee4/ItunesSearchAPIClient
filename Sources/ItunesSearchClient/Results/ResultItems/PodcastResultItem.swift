//
//  File.swift
//  
//
//  Created by Evan Mckee on 11/13/19.
//

import Foundation

public class PodcastResultItem:TrackResultItem {
    
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

    public required init(from decoder: Decoder) throws {
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
        try super.init(from: decoder)
    }

    public enum PodcastCodingKeys:String, CodingKey {
        case artworkUrl600, collectionCensoredName, collectionHdPrice, collectionId, collectionName, collectionViewUrl, feedUrl, genreIds, genres, trackCount, trackHdPrice, trackHdRentalPrice, trackRentalPrice
    }
}

