//
//  SUOverridePreset.swift
//  
//
//  Created by Bill Gestrich on 4/11/21.
//

import Foundation

public struct SUOverridePreset {
    public let name: String
    public let symbol: String
    public let targetRange: (Double, Double)
    public let insulinNeedsScaleFactor: Double
    
    public init(name: String, symbol: String, targetRange: (Double, Double), insulinNeedsScaleFactor: Double){
        self.name = name
        self.symbol = symbol
        self.targetRange = targetRange
        self.insulinNeedsScaleFactor = insulinNeedsScaleFactor
    }
    
    static public func createPresetWithDefaultNamingScheme(targetRange: (Double, Double), insulinNeedsScaleFactor: Double) -> SUOverridePreset {
        
        let name = "I: \(Int(insulinNeedsScaleFactor * 100.0))% T: \( Int(targetRange.0))"
        return SUOverridePreset(name: name, symbol: "T", targetRange: targetRange, insulinNeedsScaleFactor: insulinNeedsScaleFactor)
    }
}

extension SUOverridePreset {
    
    static public func createDefaultPresets() -> [SUOverridePreset] {
        var toRet = [SUOverridePreset]()
        var currentScalePrecent = 10.0
        while currentScalePrecent <= 200 {
            var currentTarget = 100.0
            while currentTarget <= 200 {
                let preset = SUOverridePreset.createPresetWithDefaultNamingScheme(targetRange: (currentTarget, currentTarget), insulinNeedsScaleFactor: currentScalePrecent / 100.0)
                toRet.append(preset)
                currentTarget += 10
            }
            
            currentScalePrecent += 10
        }
        
        for preset in toRet {
            print(preset.name)
        }
        
        return toRet
    }

}
