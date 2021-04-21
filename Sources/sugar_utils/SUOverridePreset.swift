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
    public let targetRange: (Int, Int)
    public let insulinNeedsPercent: Int
    
    public init(name: String, symbol: String, targetRange: (Int, Int), insulinNeedsPercent: Int){
        self.name = name
        self.symbol = symbol
        self.targetRange = targetRange
        self.insulinNeedsPercent = insulinNeedsPercent
    }
    
    public static func createPresetWithDefaultNamingScheme(targetRange: (Int, Int), insulinNeedsScaleFactor: Double) -> SUOverridePreset {
        
        let name = "I: \(Int(insulinNeedsScaleFactor * 100.0))% T: \( Int(targetRange.0))"
        return SUOverridePreset(name: name, symbol: "T", targetRange: targetRange, insulinNeedsPercent: Int(insulinNeedsScaleFactor / 100.0))
    }
    
    public static func createPresetWithDefaultNamingScheme(targetBase: Int, insulinNeedsScaleFactor: Double) -> SUOverridePreset {
        
        return createPresetWithDefaultNamingScheme(targetRange: (targetBase, targetBase + targetStep()), insulinNeedsScaleFactor: insulinNeedsScaleFactor)
    }
    
    public static func createPresetWithDefaultNamingScheme(targetBase: Int, insulinNeedsPercent: Int) -> SUOverridePreset {
        
        return createPresetWithDefaultNamingScheme(targetRange: (targetBase, targetBase + targetStep()), insulinNeedsScaleFactor: Double(insulinNeedsPercent) / 100.0)
    }
    
    static func targetStep() -> Int {
        return 20
    }
}

extension SUOverridePreset {
    
    public static func createDefaultPresets() -> [SUOverridePreset] {
        var toRet = [SUOverridePreset]()
        var currentScalePrecent = 10.0
        while currentScalePrecent <= 200 {
            var currentTarget = 100
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
