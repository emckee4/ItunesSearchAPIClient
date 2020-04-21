//
//  File.swift
//  
//
//  Created by Evan Mckee on 3/31/20.
//

import Foundation


public protocol ItunesRequest {

    var limit:Int {get}
    var baseURL:URL {get}
    var country:String? {get}
    var language:String? {get}
    var additionalQueryItems:[URLQueryItem]? {get}
    var additionalHeaderFields:[String:String]? {get}
    
    func urlRequest() -> URLRequest
}
