//
//  PaddedTextField.swift
//  GymBuddy
//
//  Created by Anes Hasicic on 15/11/2017.
//  Copyright © 2017 Anes Hasicic. All rights reserved.
//

import Foundation
import UIKit

class PaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10.0, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10.0, height: bounds.height)
    }    
}
