/*
SongTrackResultItem provides decoding of the json results of the ItunesSearchClient
Generated by Evan McKee on 14/11/2019
*/

import Foundation


public struct SongTrackResultItem: ResultItem {
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

    public enum SongTrackCodingKeys:String, CodingKey {
        case collectionArtistId, collectionArtistName, collectionCensoredName, collectionId, collectionName, collectionViewUrl, discCount, discNumber, isStreamable, previewUrl, trackCount, trackNumber, trackTimeMillis
    }
    public init(from decoder: Decoder) throws {
        let trackValues = try decoder.container(keyedBy: TrackResultCodingKeys.self)
        self.artistId = try trackValues.decodeIfPresent(Int.self, forKey: .artistId)
        self.artistName = try trackValues.decode(String.self, forKey: .artistName)
        self.artistViewUrl = try trackValues.decodeIfPresent(URL.self, forKey: .artistViewUrl)
        self.artworkUrl100 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl100)
        self.artworkUrl30 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl30)
        self.artworkUrl60 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl60)
        self.collectionExplicitness = try trackValues.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        self.collectionPrice = try trackValues.decodeIfPresent(Decimal.self, forKey: .collectionPrice)
        self.contentAdvisoryRating = try trackValues.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
        self.country = try trackValues.decodeIfPresent(String.self, forKey: .country)
        self.currency = try trackValues.decodeIfPresent(String.self, forKey: .currency)
        self.kind = try trackValues.decode(ItunesResultKind.self, forKey: .kind)
        self.primaryGenreName = try trackValues.decodeIfPresent(String.self, forKey: .primaryGenreName)
        if let releaseDateString = try trackValues.decodeIfPresent(String.self, forKey: .releaseDate) {
            self.releaseDate = ISO8601DateFormatter.default.date(from: releaseDateString)
        } else {
            self.releaseDate = nil
        }
        self.trackCensoredName = try trackValues.decodeIfPresent(String.self, forKey: .trackCensoredName)
        self.trackExplicitness = try trackValues.decodeIfPresent(String.self, forKey: .trackExplicitness)
        self.trackId = try trackValues.decodeIfPresent(Int.self, forKey: .trackId)
        self.trackName = try trackValues.decodeIfPresent(String.self, forKey: .trackName)
        self.trackPrice = try trackValues.decodeIfPresent(Decimal.self, forKey: .trackPrice)
        self.trackViewUrl = try trackValues.decodeIfPresent(URL.self, forKey: .trackViewUrl)
        self.wrapperType = try trackValues.decode(ItunesWrapperType.self, forKey: .wrapperType)
        
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
    }
}

