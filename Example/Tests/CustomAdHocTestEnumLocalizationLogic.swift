//
//  LocalizableEnumExtension.swift
//  LocalizableEnum_Example
//
//  Created by Vitandrea Sorino on 19/01/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation
import LocalizableEnum

public final class CustomAdHocTestEnumLocalizationLogic: EnumLocalizationLogic {
    
    public func localize(localizedKey: String?) -> String? {
        guard let localizedKey = localizedKey else { return nil }
        return NSLocalizedString(localizedKey , comment: "Generic comment") + " - From ad-hoc logic"
    }
    
}
