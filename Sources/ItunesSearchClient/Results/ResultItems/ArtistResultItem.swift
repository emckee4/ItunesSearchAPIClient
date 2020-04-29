//
//  ArtistResultItem.swift
//  
//
//  Created by Evan Mckee on 11/12/19.
//

import Foundation


public class ArtistResultItem:ResultItem {
    public let amgArtistId: Int?
    public let artistId: Int
    public let artistLinkUrl: URL
    public let artistName: String
    public let artistType: String
    public let primaryGenreId: Int?
    public let primaryGenreName: String?
    public override var id: Int {
        return artistId
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ArtistCodingKeys.self)
        self.amgArtistId = try values.decodeIfPresent(Int.self, forKey: .amgArtistId)
        self.artistId = try values.decode(Int.self, forKey: .artistId)
        self.artistLinkUrl = try values.decode(URL.self, forKey: .artistLinkUrl)
        self.artistName = try values.decode(String.self, forKey: .artistName)
        self.artistType = try values.decode(String.self, forKey: .artistType)
        self.primaryGenreId = try values.decodeIfPresent(Int.self, forKey: .primaryGenreId)
        self.primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        try super.init(from: decoder)
    }
    
    enum ArtistCodingKeys:String,CodingKey {
        case amgArtistId, artistId, artistLinkUrl, artistName, artistType, primaryGenreId, primaryGenreName
    }
}
