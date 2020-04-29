/*
SongTrackResultItem provides decoding of the json results of the ItunesSearchClient
Generated by Evan McKee on 14/11/2019
*/

import Foundation


public class SongTrackResultItem: TrackResultItem {
    public let collectionArtistId: Int?
    public let collectionArtistName: String?
    public let collectionCensoredName: String?
    public let collectionId: Int?
    public let collectionName: String?
    public let collectionViewUrl: URL?
    public let discCount: Int?
    public let discNumber: Int?
    public let isStreamable: Bool?
    public let previewUrl: URL?
    public let trackCount: Int?
    public let trackNumber: Int?
    public let trackTimeMillis: Int?

    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SongTrackCodingKeys.self)
        self.collectionArtistId = try values.decodeIfPresent(Int.self, forKey: .collectionArtistId)
        self.collectionArtistName = try values.decodeIfPresent(String.self, forKey: .collectionArtistName)
        self.collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        self.collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
        self.collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        self.collectionViewUrl = try values.decodeIfPresent(URL.self, forKey: .collectionViewUrl)
        self.discCount = try values.decodeIfPresent(Int.self, forKey: .discCount)
        self.discNumber = try values.decodeIfPresent(Int.self, forKey: .discNumber)
        self.isStreamable = try values.decodeIfPresent(Bool.self, forKey: .isStreamable)
        self.previewUrl = try values.decodeIfPresent(URL.self, forKey: .previewUrl)
        self.trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
        self.trackNumber = try values.decodeIfPresent(Int.self, forKey: .trackNumber)
        self.trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
        try super.init(from: decoder)
    }
    
    public enum SongTrackCodingKeys:String, CodingKey {
        case collectionArtistId, collectionArtistName, collectionCensoredName, collectionId, collectionName, collectionViewUrl, discCount, discNumber, isStreamable, previewUrl, trackCount, trackNumber, trackTimeMillis
    }
    
}

