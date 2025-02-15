//
//  CustomEnumLocalizationLogic.swift
//  LocalizableEnum_Example
//
//  Created by Vitandrea Sorino on 19/01/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation
import LocalizableEnum

/// In order to make it work, the 'LocalizableEnumManager' singleton MUST have an implementation of the logic,
/// otherwise a fatalError( ) will be called.
///
/// Here we are creating an base logic with the NSLocalizedString logic,
/// but you can use whatever wrapper class o mechanism used into your application.
public final class CustomEnumLocalizationLogic: EnumLocalizationLogic {
    
    public func localize(localizedKey: String?) -> String? {
        guard let localizedKey = localizedKey else { return nil }
        return NSLocalizedString(localizedKey , comment: "Generic comment") + " - From default logic"
    }
    
}

