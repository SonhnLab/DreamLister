//
//  MaterialView.swift
//  DreamLister
//
//  Created by Son Ho on 5/24/18.
//  Copyright © 2018 Son Ho. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {

    @IBInspectable var materialDesign: Bool {
        get {
            return materialKey
        }
        set {
            materialKey = newValue
            if materialKey {
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 4.0
                self.layer.shadowOpacity = 0.75
                self.layer.shadowRadius = 4.0
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
                self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
            } else {
                self.layer.cornerRadius = 0.0
                self.layer.shadowOpacity = 0.0
                self.layer.shadowRadius = 0.0
                self.layer.shadowColor = nil
            }
        }
        
    }

}
