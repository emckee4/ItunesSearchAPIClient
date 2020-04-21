//
//  ArtistResultItem.swift
//  
//
//  Created by Evan Mckee on 11/12/19.
//

import Foundation


//["amgArtistId", "primaryGenreId", "wrapperType", "artistName", "artistId", "artistLinkUrl", "artistType", "primaryGenreName"]
public struct ArtistResultItem:ResultItem {
    public let amgArtistId: Int?
    public let artistId: Int
    public let artistLinkUrl: URL
    public let artistName: String
    public let artistType: String
    public let primaryGenreId: Int?
    public let primaryGenreName: String?
    public let wrapperType: ItunesWrapperType

}
