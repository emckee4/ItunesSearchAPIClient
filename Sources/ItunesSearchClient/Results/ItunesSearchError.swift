//
//  File.swift
//  
//
//  Created by Evan Mckee on 4/6/20.
//

import Foundation

public enum ItunesSearchError:Error {
    case network(_ underlyingError:Error? = nil)
    case badResponse(_ status: Int, message: String? = nil)
    case parsing(_ underlyingError:Error? = nil)
    case unknown(_ underlyingError:Error? = nil)
}
