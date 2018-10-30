//
//  Workout.swift
//  GymBuddy
//
//  Created by Anes Hasicic on 29/11/2017.
//  Copyright © 2017 Anes Hasicic. All rights reserved.
//

import Foundation

class WorkoutDay {
    var day: String = ""
    var workout: Workout = Workout()
    
    // TODO - Add log data structure
    
    init(day: String) {
        self.day = day
    }
}

class Workout {
    public var exercises: [Exercise] = []
    
    init() {
        exercises = []
    }
    
    public func addExercise(e: Exercise) {
        exercises.append(e)
    }
}

