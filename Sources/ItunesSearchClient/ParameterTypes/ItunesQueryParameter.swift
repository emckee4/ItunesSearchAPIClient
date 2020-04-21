//
//  ITunesQueryParameter.swift
//  
//
//  Created by Evan Mckee on 4/4/20.
//

import Foundation

public protocol ItunesQueryParameter:RawRepresentable, CaseIterable, Identifiable where RawValue == String {
    
}

extension ItunesQueryParameter {
    public var id: String { rawValue }
}
