# LocalizableEnum

[![Version](https://img.shields.io/cocoapods/v/LocalizableEnum.svg?style=flat)](https://cocoapods.org/pods/LocalizableEnum)
[![License](https://img.shields.io/cocoapods/l/LocalizableEnum.svg?style=flat)](https://cocoapods.org/pods/LocalizableEnum)
[![Platform](https://img.shields.io/cocoapods/p/LocalizableEnum.svg?style=flat)](https://cocoapods.org/pods/LocalizableEnum)

## What is it?
Fast localization for enum based localization strings.
This Swift library offers a powerful and streamlined way to localize enum-based values using an approach inspired by Encoding and Decoding CodingKeys. It simplifies the process of mapping enums to localized strings, reducing boilerplate code and enhancing readability in your projects. By leveraging the power of enums and their type-safe structure, the library eliminates the need for fragile hardcoded keys or verbose localization logic. It provides a seamless API to link your enum cases directly to localized values, ensuring consistency and reducing the risk of mismatched or missing keys.

## Installation

LocalizableEnum is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LocalizableEnum'
```

## Configuration
Create a custom logic class:
```swift
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

```

Set the custom logic into the application(didFinishLaunchingWithOptions):

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    // Setting the default localization logic
    LocalizableEnumManager.shared.defaultLogic = CustomEnumLocalizationLogic()
    
    return true
}
```

## Setup

Define the enum directly connected to the localization string. Make it conform to the LocalizableEnum protocol.
Define a inner enum in the following way. 
For each case, use the localization key as rawValue.

```swift
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
```

The localizations file are thus formed:
Localizable.string - IT
```swift
"localization_test_string" = "Questa è la stringa di testo localizzata in italiano";
"car_string" = "Macchina";
"motorbike_string" = "Motocicletta";
"bike_string" = "Bici";
```
Localizable.string - EN
```swift
"localization_test_string" = "This is the english localized test string";
"car_string" = "Car";
"motorbike_string" = "Motorbike";
"bike_string" = "Bike";
```

## Usage
You can use one of this two method to access the localized value:
```swift
public protocol Valuable {
    func getLocalizedValue(_ logic: EnumLocalizationLogic) -> String?
    var localizedValue: String? { get }
}
```

The computed property uses the default logic (LocalizableEnumManager.shared.defaultLogic):
```swift
///Usage with default localization logic
carLabel.text = VehicleType.car.localizedValue
motorbikeLabel.text = VehicleType.motorbike.localizedValue
```

For the getLocalizedValue(), you must provide a new logic:
```swift
/// Ad-Hoc logic
extension ViewController: EnumLocalizationLogic {
    func localize(localizedKey: String?) -> String? {
        guard let localizedKey = localizedKey else { return nil }
        return NSLocalizedString(localizedKey , comment: "Generic comment") + " - From ad-hoc logic"
    }
}
```

```swift
///Usage with ad-hoc localization logic
bikeLabel.text = VehicleType.bike.getLocalizedValue(self)
```

## Author

Vitandrea Sorino, vitandrea98@live.it

## License

LocalizableEnum is available under the MIT license. See the LICENSE file for more info.
