//
//  LocalizableEnumManager.swift
//  LocalizableEnum
//
//  Created by Vitandrea Sorino on 15/02/25.
//

/// Manager class to define de default localization logic
/// Warning: this class is not thread safe
/// USI IT ONLY FROM THE AppDelegate(.. didFinishLaunchingWithOptions)
public final class LocalizableEnumManager: @unchecked Sendable {
    
    private init() {
        selectedLogic = DefaultEnumLocalizationLogic()
    }
    
    public static let shared = LocalizableEnumManager()
    private var selectedLogic: EnumLocalizationLogic
    
    public var defaultLogic: EnumLocalizationLogic {
        set { selectedLogic = newValue }
        get { return selectedLogic }
    }
}
