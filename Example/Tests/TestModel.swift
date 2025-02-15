//
//  Model.swift
//  LocalizableEnum_Example
//
//  Created by Vitandrea Sorino on 19/01/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation
import LocalizableEnum

/// Well formatted enum
enum VehicleType: LocalizableEnum {
    case car
    case motorbike
    case bike
    
    enum LocalizableEnumKeys: String, LocalizableEnumKey {
        case car = "car_string"
        case motorbike = "motorbike_string"
        case bike = "bike_string"
    }
}

/// Single case missing
enum VehicleTypeSingleCaseMissing: LocalizableEnum {
    case car
    case motorbike
    case bike
    
    enum LocalizableEnumKeys: String, LocalizableEnumKey {
        case car = "car_string"
        case motorbike = "motorbike_string"
    }
}

/// Outer enum with String rawValue
enum VehicleTypeOuterEnumStringRawRapresentable: String, LocalizableEnum {
    case car = "CAR"
    case motorbike = "motorbike"
    case bike = "bike"
    
    enum LocalizableEnumKeys: String, LocalizableEnumKey {
        case car = "car_string"
        case motorbike = "motorbike_string"
        case bike = "bike_string"
    }
}
