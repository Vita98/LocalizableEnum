//
//  DefaultEnumLocalizationLogic.swift
//  LocalizableEnum
//
//  Created by Vitandrea Sorino on 15/02/25.
//

/// Default localization logic
/// Warning: This default implementation class throws a fatalError
/// IN ORDER TO MAKE IT WORK, YOU MUST CREATE A CLASS CONFORM TO THE EnumLocalizationLogic
/// AND SET IT INTO THE LocalizableEnumManager
public final class DefaultEnumLocalizationLogic: EnumLocalizationLogic {
    
    public func localize(localizedKey: String?) -> String? {
        fatalError("Change the enum localization logic!")
    }
    
}
