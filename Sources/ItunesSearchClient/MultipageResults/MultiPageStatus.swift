//
//  File.swift
//  
//
//  Created by Evan Mckee on 5/1/20.
//

import Foundation

public enum MultiPageStatus {
    case ready(nextOffset:Int)
    case loading(offset:Int)
    case complete
}
