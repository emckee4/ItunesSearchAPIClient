//
//  TrackResultItem.swift
//  Base for all track results containing common keys.
//
//  Created by Evan Mckee on 11/12/19.
//

import Foundation

public protocol TrackResultItem:ResultItem {
    var artistId: Int? {get}
    var artistName: String {get}
    var artistViewUrl: URL? {get}
    var artworkUrl100: URL? {get}
    var artworkUrl30: URL? {get}
    var artworkUrl60: URL? {get}
    var collectionExplicitness: String? {get}
    var collectionPrice: Decimal? {get}
    var contentAdvisoryRating: String? {get}
    var country: String? {get}
    var currency: String? {get}
    var kind: ItunesResultKind {get}
    var primaryGenreName: String? {get}
    var releaseDate: Date? {get}
    var trackCensoredName: String? {get}
    var trackExplicitness: String? {get}
    var trackId: Int? {get}
    var trackName: String? {get}
    var trackPrice: Decimal? {get}
    var trackViewUrl: URL? {get}
    var wrapperType: ItunesWrapperType {get}
}


//public class TrackResultItem:ResultItem {
//        public let artistId: Int?
//        public let artistName: String
//        public let artistViewUrl: URL?
//        public let artworkUrl100: URL?
//        public let artworkUrl30: URL?
//        public let artworkUrl60: URL?
//        public let collectionExplicitness: String?
//        public let collectionPrice: Decimal?
//        public let contentAdvisoryRating: String?
//        public let country: String?
//        public let currency: String?
//        public let kind: TrackKind
//        public let primaryGenreName: String?
//        public let releaseDate: Date?
//        public let trackCensoredName: String?
//        public let trackExplicitness: String?
//        public let trackId: Int?
//        public let trackName: String?
//        public let trackPrice: Decimal?
//        public let trackViewUrl: URL?
//        public let wrapperType: WrapperType
//
//
//
//
//
//    required public init(from decoder: Decoder) throws {
//        let trackValues = try decoder.container(keyedBy: TrackResultCodingKeys.self)
//        self.artistId = try trackValues.decodeIfPresent(Int.self, forKey: .artistId)
//        self.artistName = try trackValues.decode(String.self, forKey: .artistName)
//        self.artistViewUrl = try trackValues.decodeIfPresent(URL.self, forKey: .artistViewUrl)
//        self.artworkUrl100 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl100)
//        self.artworkUrl30 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl30)
//        self.artworkUrl60 = try trackValues.decodeIfPresent(URL.self, forKey: .artworkUrl60)
//        self.collectionExplicitness = try trackValues.decodeIfPresent(String.self, forKey: .collectionExplicitness)
//        self.collectionPrice = try trackValues.decodeIfPresent(Decimal.self, forKey: .collectionPrice)
//        self.contentAdvisoryRating = try trackValues.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
//        self.country = try trackValues.decodeIfPresent(String.self, forKey: .country)
//        self.currency = try trackValues.decodeIfPresent(String.self, forKey: .currency)
//        self.kind = try trackValues.decode(TrackKind.self, forKey: .kind)
//        self.primaryGenreName = try trackValues.decodeIfPresent(String.self, forKey: .primaryGenreName)
//        if let releaseDateString = try trackValues.decodeIfPresent(String.self, forKey: .releaseDate) {
//            self.releaseDate = ISO8601DateFormatter.default.date(from: releaseDateString)
//        } else {
//            self.releaseDate = nil
//        }
//        self.trackCensoredName = try trackValues.decodeIfPresent(String.self, forKey: .trackCensoredName)
//        self.trackExplicitness = try trackValues.decodeIfPresent(String.self, forKey: .trackExplicitness)
//        self.trackId = try trackValues.decodeIfPresent(Int.self, forKey: .trackId)
//        self.trackName = try trackValues.decodeIfPresent(String.self, forKey: .trackName)
//        self.trackPrice = try trackValues.decodeIfPresent(Decimal.self, forKey: .trackPrice)
//        self.trackViewUrl = try trackValues.decodeIfPresent(URL.self, forKey: .trackViewUrl)
//        self.wrapperType = try trackValues.decode(WrapperType.self, forKey: .wrapperType)
//    }
//
//}

public enum TrackResultCodingKeys:String, CodingKey {
    case artistId, artistName, artistViewUrl, artworkUrl100, artworkUrl30, artworkUrl60, collectionExplicitness, collectionPrice, contentAdvisoryRating, country, currency, kind, primaryGenreName, releaseDate, trackCensoredName, trackExplicitness, trackId, trackName, trackPrice, trackViewUrl, wrapperType
}
