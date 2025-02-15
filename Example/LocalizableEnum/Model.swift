//
//  Model.swift
//  LocalizableEnum_Example
//
//  Created by Vitandrea Sorino on 19/01/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation
import LocalizableEnum

/// Enum MUST CONFORM to the LocalizableEnum protocol
enum VehicleType: LocalizableEnum {
    case car
    case motorbike
    case bike
    
    /// Inner enum to define the LocalizableEnumKeys
    /// This is the step similar to that of the CodingKey
    enum LocalizableEnumKeys: String, LocalizableEnumKey {
        case car = "car_string"
        case motorbike = "motorbike_string"
        case bike = "bike_string"
    }
}

