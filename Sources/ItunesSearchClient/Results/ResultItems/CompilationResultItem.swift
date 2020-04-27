//
//  CompilationResultItem.swift
//  
//
//  Created by Evan Mckee on 4/27/20.
//

import Foundation

public struct CompilationResultItem: CollectionResultItem {
    public let artistId: Int?
    public let artistName: String?
    public let artistViewUrl: URL?
    public let artworkUrl100: URL?
    public let artworkUrl60: URL?
    public let collectionCensoredName: String?
    public let collectionExplicitness: String?
    public let collectionId: Int?
    public let collectionName: String?
    public let collectionPrice: Decimal?
    public let collectionType: String?
    public let collectionViewUrl: URL?
    public let contentAdvisoryRating: String?
    public let copyright: String?
    public let country: String?
    public let currency: String?
    public let primaryGenreName: String?
    public let releaseDate: Date?
    public let trackCount: Int?
    public let wrapperType: ItunesWrapperType
    
    public init(from decoder: Decoder) throws {
        let collectionValues = try decoder.container(keyedBy: CollectionCodingKeys.self)
        self.artistId = try collectionValues.decodeIfPresent(Int.self, forKey: .artistId)
        self.artistName = try collectionValues.decodeIfPresent(String.self, forKey: .artistName)
        self.artistViewUrl = try collectionValues.decodeIfPresent(URL.self, forKey: .artistViewUrl)
        self.artworkUrl100 = try collectionValues.decodeIfPresent(URL.self, forKey: .artworkUrl100)
        self.artworkUrl60 = try collectionValues.decodeIfPresent(URL.self, forKey: .artworkUrl60)
        self.collectionCensoredName = try collectionValues.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        self.collectionExplicitness = try collectionValues.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        self.collectionId = try collectionValues.decodeIfPresent(Int.self, forKey: .collectionId)
        self.collectionName = try collectionValues.decodeIfPresent(String.self, forKey: .collectionName)
        self.collectionPrice = try collectionValues.decodeIfPresent(Decimal.self, forKey: .collectionPrice)
        self.collectionType = try collectionValues.decodeIfPresent(String.self, forKey: .collectionType)
        self.collectionViewUrl = try collectionValues.decodeIfPresent(URL.self, forKey: .collectionViewUrl)
        self.contentAdvisoryRating = try collectionValues.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
        self.copyright = try collectionValues.decodeIfPresent(String.self, forKey: .copyright)
        self.country = try collectionValues.decodeIfPresent(String.self, forKey: .country)
        self.currency = try collectionValues.decodeIfPresent(String.self, forKey: .currency)
        self.primaryGenreName = try collectionValues.decodeIfPresent(String.self, forKey: .primaryGenreName)
        if let releaseDateString = try collectionValues.decodeIfPresent(String.self, forKey: .releaseDate) {
            self.releaseDate = ISO8601DateFormatter.default.date(from: releaseDateString)
        } else {
            self.releaseDate = nil
        }
        self.trackCount = try collectionValues.decodeIfPresent(Int.self, forKey: .trackCount)
        self.wrapperType = try collectionValues.decode(ItunesWrapperType.self, forKey: .wrapperType)
    }
}
