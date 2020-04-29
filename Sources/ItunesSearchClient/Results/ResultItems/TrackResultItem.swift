//
//  TrackResultItem.swift
//  Base for all track results containing common keys.
//
//  Created by Evan Mckee on 11/12/19.
//

import Foundation

public class TrackResultItem:ResultItem {
    public var artistId: Int?
    public var artistName: String
    public var artistViewUrl: URL?
    public var artworkUrl100: URL?
    public var artworkUrl30: URL?
    public var artworkUrl60: URL?
    public var collectionExplicitness: String?
    public var collectionPrice: Decimal?
    public var contentAdvisoryRating: String?
    public var country: String?
    public var currency: String?
    public var kind: ItunesResultKind
    public var primaryGenreName: String?
    public var releaseDate: Date?
    public var trackCensoredName: String?
    public var trackExplicitness: String?
    public var trackId: Int
    public var trackName: String?
    public var trackPrice: Decimal?
    public var trackViewUrl: URL?
    public override var id: Int {
        return trackId
 
    }
    
        required public init(from decoder: Decoder) throws {
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
            self.trackId = try trackValues.decode(Int.self, forKey: .trackId)
            self.trackName = try trackValues.decodeIfPresent(String.self, forKey: .trackName)
            self.trackPrice = try trackValues.decodeIfPresent(Decimal.self, forKey: .trackPrice)
            self.trackViewUrl = try trackValues.decodeIfPresent(URL.self, forKey: .trackViewUrl)
            try super.init(from: decoder)
        }
    
    enum TrackResultCodingKeys:String, CodingKey {
        case artistId, artistName, artistViewUrl, artworkUrl100, artworkUrl30, artworkUrl60, collectionExplicitness, collectionPrice, contentAdvisoryRating, country, currency, kind, primaryGenreName, releaseDate, trackCensoredName, trackExplicitness, trackId, trackName, trackPrice, trackViewUrl, wrapperType
    }
}



