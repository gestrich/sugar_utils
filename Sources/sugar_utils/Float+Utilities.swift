//
//  Float+Utilities.swift
//  
//
//  Created by Bill Gestrich on 5/8/21.
//

import Foundation

extension Float
{
    func truncate(places : UInt)-> Float {
        let factor: Float = pow(10, Float(places))
        return (self * factor).rounded(.towardZero) / factor
    }
}
