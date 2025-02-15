import XCTest
import LocalizableEnum

class Tests: XCTestCase {
    
    /// Testing the key a well-formatted enum, with all LocalizableEnumKey defined
    func test_keys_normal_case() {
        XCTAssertEqual(VehicleType.car.localizableKey, "car_string")
        XCTAssertEqual(VehicleType.motorbike.localizableKey, "motorbike_string")
        XCTAssertEqual(VehicleType.bike.localizableKey, "bike_string")
        
        XCTAssertEqual(VehicleType.car.getLocalizableKey(), "car_string")
        XCTAssertEqual(VehicleType.motorbike.getLocalizableKey(), "motorbike_string")
        XCTAssertEqual(VehicleType.bike.getLocalizableKey(), "bike_string")
    }
    
    func test_keys_single_case_missing() {
        XCTAssertEqual(VehicleTypeSingleCaseMissing.car.localizableKey, "car_string")
        XCTAssertEqual(VehicleTypeSingleCaseMissing.motorbike.localizableKey, "motorbike_string")
        XCTAssertNil(VehicleTypeSingleCaseMissing.bike.localizableKey)
        
        XCTAssertEqual(VehicleTypeSingleCaseMissing.car.getLocalizableKey(), "car_string")
        XCTAssertEqual(VehicleTypeSingleCaseMissing.motorbike.getLocalizableKey(), "motorbike_string")
        XCTAssertNil(VehicleTypeSingleCaseMissing.bike.getLocalizableKey())
    }
    
    func test_keys_outere_enum_string_raw_rapresentable() {
        XCTAssertEqual(VehicleTypeOuterEnumStringRawRapresentable.car.localizableKey, "car_string")
        XCTAssertEqual(VehicleTypeOuterEnumStringRawRapresentable.motorbike.localizableKey, "motorbike_string")
        XCTAssertEqual(VehicleTypeOuterEnumStringRawRapresentable.bike.localizableKey, "bike_string")
        
        XCTAssertEqual(VehicleTypeOuterEnumStringRawRapresentable.car.getLocalizableKey(), "car_string")
        XCTAssertEqual(VehicleTypeOuterEnumStringRawRapresentable.motorbike.getLocalizableKey(), "motorbike_string")
        XCTAssertEqual(VehicleTypeOuterEnumStringRawRapresentable.bike.getLocalizableKey(), "bike_string")
    }
    
    func test_values_no_default() {
        XCTExpectFailure {
            XCTAssertEqual(VehicleType.car.localizedValue, "") // This line must fail if no custom logic is implemented
        }
    }
    
    func test_default_logic() {
        let originalLogic: EnumLocalizationLogic = LocalizableEnumManager.shared.defaultLogic
        LocalizableEnumManager.shared.defaultLogic = CustomDefaultTestEnumLocalizationLogic()
        
        defer {
            LocalizableEnumManager.shared.defaultLogic = originalLogic
        }
        
        XCTAssertEqual(VehicleType.car.localizedValue, "Car - From default logic")
        XCTAssertEqual(VehicleType.motorbike.localizedValue, "Motorbike - From default logic")
        XCTAssertEqual(VehicleType.bike.localizedValue, "Bike - From default logic")
        
        XCTAssertEqual(VehicleType.car.localizedValue, VehicleType.car.getLocalizedValue(LocalizableEnumManager.shared.defaultLogic))
        XCTAssertEqual(VehicleType.motorbike.localizedValue, VehicleType.motorbike.getLocalizedValue(LocalizableEnumManager.shared.defaultLogic))
        XCTAssertEqual(VehicleType.bike.localizedValue, VehicleType.bike.getLocalizedValue(LocalizableEnumManager.shared.defaultLogic))
    }
    
    func test_adhoc_logic() {
        let originalLogic: EnumLocalizationLogic = LocalizableEnumManager.shared.defaultLogic
        let adHocLogic: EnumLocalizationLogic = CustomAdHocTestEnumLocalizationLogic()
        LocalizableEnumManager.shared.defaultLogic = CustomDefaultTestEnumLocalizationLogic()
        
        defer {
            LocalizableEnumManager.shared.defaultLogic = originalLogic
        }
        
        XCTAssertEqual(VehicleType.car.getLocalizedValue(adHocLogic), "Car - From ad-hoc logic")
        XCTAssertEqual(VehicleType.motorbike.getLocalizedValue(adHocLogic), "Motorbike - From ad-hoc logic")
        XCTAssertEqual(VehicleType.bike.getLocalizedValue(adHocLogic), "Bike - From ad-hoc logic")
    }
    
}
