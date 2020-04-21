//
//  ResultItem.swift
//  
//
//  Created by Evan Mckee on 11/12/19.
//

import Foundation

public protocol ResultItem:Decodable, ReflectedStringConvertible {
    var wrapperType:ItunesWrapperType {get}
}



