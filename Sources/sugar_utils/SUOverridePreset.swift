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
    
    public static func createPresetWithDefaultNamingScheme(targetRange: (Double, Double), insulinNeedsScaleFactor: Double) -> SUOverridePreset {
        
        let name = "I: \(Int(insulinNeedsScaleFactor * 100.0))% T: \( Int(targetRange.0))"
        return SUOverridePreset(name: name, symbol: "T", targetRange: targetRange, insulinNeedsScaleFactor: insulinNeedsScaleFactor)
    }
    
    public static func createPresetWithDefaultNamingScheme(targetBase: Double, insulinNeedsScaleFactor: Double) -> SUOverridePreset {
        
        return createPresetWithDefaultNamingScheme(targetRange: (targetBase, targetBase + targetStep()), insulinNeedsScaleFactor: insulinNeedsScaleFactor)
    }
    
    public static func createPresetWithDefaultNamingScheme(targetBase: Double, insulinNeedsPercent: Double) -> SUOverridePreset {
        
        return createPresetWithDefaultNamingScheme(targetRange: (targetBase, targetBase + targetStep()), insulinNeedsScaleFactor: insulinNeedsPercent / 100.0)
    }
    
    static func targetStep() -> Double {
        return 20.0
    }
}

extension SUOverridePreset {
    
    public static func createDefaultPresets() -> [SUOverridePreset] {
        var toRet = [SUOverridePreset]()
        var currentScalePrecent = 10.0
        while currentScalePrecent <= 200 {
            var currentTarget = 100.0
            while currentTarget <= 200 {
                let preset = SUOverridePreset.createPresetWithDefaultNamingScheme(targetRange: (currentTarget, currentTarget + targetStep()), insulinNeedsScaleFactor: currentScalePrecent / 100.0)
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
