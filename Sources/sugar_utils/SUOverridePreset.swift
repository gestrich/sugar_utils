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
    public let targetRange: (minValue: Int, maxValue: Int)
    public let insulinNeedsPercent: Int
    
    public init(name: String, symbol: String, targetRange: (Int, Int), insulinNeedsPercent: Int){
        self.name = name
        self.symbol = symbol
        self.targetRange = targetRange
        self.insulinNeedsPercent = insulinNeedsPercent
    }
    
    public func insulinNeedsScaleFactor() -> Double {
        return Double(insulinNeedsPercent) / 100.0
    }
    
    public static func createDefaultPreset(baseTarget: Int, insulinNeedsPercent: Int) -> SUOverridePreset {
        let name = "I: \(insulinNeedsPercent)% T: \( Int(baseTarget))"
        let targetRange = (baseTarget, baseTarget + targetStep())
        return SUOverridePreset(name: name, symbol: "T", targetRange: targetRange, insulinNeedsPercent: insulinNeedsPercent)
    }
    
    public static func createDefaultPreset(baseTarget: Int, insulinNeedsScaleFactor: Double) -> SUOverridePreset {
        return createDefaultPreset(baseTarget: baseTarget, insulinNeedsPercent: Int(insulinNeedsScaleFactor * 100))
    }
    
    static func targetStep() -> Int {
        return 20
    }
}

extension SUOverridePreset {
    
    public static func createDefaultPresets() -> [SUOverridePreset] {
        var toRet = [SUOverridePreset]()
        var insulinPercent = 10
        while insulinPercent <= 200 {
            var baseTarget = 100
            while baseTarget <= 200 {
                let preset = SUOverridePreset.createDefaultPreset(baseTarget: baseTarget, insulinNeedsPercent: insulinPercent)
                toRet.append(preset)
                baseTarget += 10
            }
            
            insulinPercent += 5
        }
        
        return toRet
    }

}
