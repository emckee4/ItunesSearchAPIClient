//
//  File.swift
//  
//
//  Created by Evan Mckee on 4/4/20.
//

import Foundation

enum ItunesSearchResultErrors:Error {
    case unsupportedType(description:String? = nil)
    
    var localizedDescription: String {
        switch self {
        case .unsupportedType(description: let description):
            return "unsupportedType: \(description ?? "")"
        }
    }
}
