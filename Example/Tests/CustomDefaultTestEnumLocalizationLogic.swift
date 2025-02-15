//
//  CustomEnumLocalizationLogic.swift
//  LocalizableEnum
//
//  Created by Vitandrea Sorino on 15/02/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation
import LocalizableEnum

public final class CustomDefaultTestEnumLocalizationLogic: EnumLocalizationLogic {
    
    public func localize(localizedKey: String?) -> String? {
        guard let localizedKey = localizedKey else { return nil }
        return NSLocalizedString(localizedKey , comment: "Generic comment") + " - From default logic"
    }
    
}
