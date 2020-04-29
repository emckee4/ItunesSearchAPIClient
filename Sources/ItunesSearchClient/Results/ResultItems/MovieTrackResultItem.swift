//
//  File.swift
//  
//
//  Created by Evan Mckee on 3/11/20.
//

import Foundation


public class MovieTrackResultItem: TrackResultItem {
    
    public let collectionArtistId: String?
    public let collectionArtistViewUrl: String?
    public let collectionCensoredName: String?
    public let collectionHdPrice: String?
    public let collectionId: String?
    public let collectionName: String?
    public let collectionViewUrl: String?
    public let discCount: String?
    public let discNumber: String?
    public let hasITunesExtras: String?
    public let longDescription: String?
    public let previewUrl: String?
    public let shortDescription: String?
    public let trackCount: String?
    public let trackHdPrice: String?
    public let trackHdRentalPrice: String?
    public let trackNumber: String?
    public let trackRentalPrice: String?
    public let trackTimeMillis: Int?
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MovieTrackCodingKeys.self)
        self.collectionArtistId = try values.decodeIfPresent(String.self, forKey: .collectionArtistId)
        self.collectionArtistViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionArtistViewUrl)
        self.collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        self.collectionHdPrice = try values.decodeIfPresent(String.self, forKey: .collectionHdPrice)
        self.collectionId = try values.decodeIfPresent(String.self, forKey: .collectionId)
        self.collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        self.collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        self.discCount = try values.decodeIfPresent(String.self, forKey: .discCount)
        self.discNumber = try values.decodeIfPresent(String.self, forKey: .discNumber)
        self.hasITunesExtras = try values.decodeIfPresent(String.self, forKey: .hasITunesExtras)
        self.longDescription = try values.decodeIfPresent(String.self, forKey: .longDescription)
        self.previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
        self.shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription)
        self.trackCount = try values.decodeIfPresent(String.self, forKey: .trackCount)
        self.trackHdPrice = try values.decodeIfPresent(String.self, forKey: .trackHdPrice)
        self.trackHdRentalPrice = try values.decodeIfPresent(String.self, forKey: .trackHdRentalPrice)
        self.trackNumber = try values.decodeIfPresent(String.self, forKey: .trackNumber)
        self.trackRentalPrice = try values.decodeIfPresent(String.self, forKey: .trackRentalPrice)
        self.trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
        try super.init(from: decoder)
    }
    
    enum MovieTrackCodingKeys:String, CodingKey {
        case collectionArtistId, collectionArtistViewUrl, collectionCensoredName, collectionHdPrice, collectionId, collectionName, collectionViewUrl, discCount, discNumber, hasITunesExtras, longDescription, previewUrl, shortDescription, trackCount, trackHdPrice, trackHdRentalPrice, trackNumber, trackRentalPrice, trackTimeMillis
    }
}


