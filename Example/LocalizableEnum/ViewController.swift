//
//  ViewController.swift
//  LocalizableEnum
//
//  Created by Vita98 on 02/15/2025.
//  Copyright (c) 2025 Vita98. All rights reserved.
//

import UIKit
import LocalizableEnum

class ViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var motorbikeLabel: UILabel!
    @IBOutlet weak var bikeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        ///Usage with default localization logic
        carLabel.text = VehicleType.car.localizedValue
        motorbikeLabel.text = VehicleType.motorbike.localizedValue
        
        ///Usage with ad-hoc localization logic
        bikeLabel.text = VehicleType.bike.getLocalizedValue(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/// Ad-Hoc logic
extension ViewController: EnumLocalizationLogic {
    func localize(localizedKey: String?) -> String? {
        guard let localizedKey = localizedKey else { return nil }
        return NSLocalizedString(localizedKey , comment: "Generic comment") + " - From ad-hoc logic"
    }
}

