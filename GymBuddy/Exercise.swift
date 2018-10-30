//
//  Workout.swift
//  GymBuddy
//
//  Created by Anes Hasicic on 14/11/2017.
//  Copyright © 2017 Anes Hasicic. All rights reserved.
//

import Foundation
import UIKit

struct Exercise {
    var id: Int64
    var name: String
    var bgColor: CGColor
    var icon: String
}

struct Set {
    var reps: Int
    var weight: Float
}

struct MuscleGroup {
    var name: String
    var icon: String
}
