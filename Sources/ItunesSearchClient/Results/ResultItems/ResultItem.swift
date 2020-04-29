//
//  ResultItem.swift
//  
//
//  Created by Evan Mckee on 11/12/19.
//

import Foundation

public class ResultItem:Decodable, ReflectedStringConvertible, Identifiable {
    public var wrapperType:ItunesWrapperType
    ///The identifiable id is computed from the relevent field in the concrete result item
    public var id:Int {return 0}
}
