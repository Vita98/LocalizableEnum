//
//  LocalizableEnum.swift
//  LocalizableEnum
//
//  Created by Vitandrea Sorino on 15/02/25.
//

import Foundation

/// Protocol to define the NAME of the NESTED ENUM
public protocol LocalizableEnumKey where Self: CaseIterable {}

public protocol Keyable {
    func getLocalizableKey() -> String?
    var localizableKey: String? { get }
}

public protocol Valuable {
    func getLocalizedValue(_ logic: EnumLocalizationLogic) -> String?
    var localizedValue: String? { get }
}

/// Localizable protocol
public protocol LocalizableEnum: Keyable, Valuable {
    associatedtype LocalizableEnumKeys: LocalizableEnumKey, RawRepresentable where LocalizableEnumKeys.RawValue == String
}

/// Protocol to define the custom logic for localization
public protocol EnumLocalizationLogic {
    func localize(localizedKey: String?) -> String?
}

/// Default implementation for the localizedKey method
public extension LocalizableEnum {
    
    /// Return the string key defined into the LocalizableEnumKeys enum as string rawValue
    /// - Returns: the localized key
    /// - Warning: if the corresponding 'LokalizableEnumKeys' enum key is not found, nil will be returned
    func getLocalizableKey() -> String? {
        guard let matchCase = LocalizableEnumKeys.allCases.filter({ String(describing: $0) == String(describing: self)}).first
        else { return nil }
        
        return matchCase.rawValue
    }
    
    var localizableKey: String? {
        return getLocalizableKey()
    }
    
    //Valuable Conformance
    func getLocalizedValue(_ logic: EnumLocalizationLogic) -> String? {
        return logic.localize(localizedKey: getLocalizableKey())
    }
    
    var localizedValue: String? {
        return getLocalizedValue(LocalizableEnumManager.shared.defaultLogic)
    }
}
