//
//  ReflectedStringConvertible.swift
//  
//
//  Created by Evan Mckee on 3/30/20.
//

import Foundation

public protocol ReflectedStringConvertible : CustomStringConvertible { }

extension ReflectedStringConvertible {
    public var description: String {
        let mirror = Mirror(reflecting: self)
        
        var str = "\(mirror.subjectType)("
        var first = true
        for (label, value) in mirror.children {
            if let label = label {
                if first {
                    first = false
                } else {
                    str += ", "
                }
                str += "\(label): "
                switch value {
                case Optional<Any>.some(let val):
                    str += "\(val)"
                case Optional<Any>.none:
                    str += "nil"
                default:
                    str += "\(value)"
                }
            }
        }
        str += ")"
        
        return str
    }
}
