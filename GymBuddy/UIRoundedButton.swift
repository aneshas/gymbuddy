//
//  UIRoundedButton.swift
//  GymBuddy
//
//  Created by Anes Hasicic on 23/11/2017.
//  Copyright © 2017 Anes Hasicic. All rights reserved.
//

import UIKit

class UIRoundedButton: UIButton {
    
    var groups: [MuscleGroup] = []
    
    override func layoutSubviews() {
//        groups.append(MuscleGroup(name: "Foo", icon: "Bar"))
//
//        groups.append(MuscleGroup(name: "Arms", icon: "arm-icon.png"))
//        groups.append(MuscleGroup(name: "Back", icon: "back-icon.png"))
//        groups.append(MuscleGroup(name: "Chest", icon: "chest-icon.png"))
//        groups.append(MuscleGroup(name: "Shoulders", icon: "shoulder-icon.png"))
//        groups.append(MuscleGroup(name: "Legs", icon: "legs-icon.png"))
//        groups.append(MuscleGroup(name: "Calves", icon: "calf-icon.png"))
//
        super.layoutSubviews()
        layer.cornerRadius = 3.0
//
//        titleLabel!.textAlignment = .left
//        titleLabel!.frame.origin.x = 80.0
//        titleLabel!.frame.origin.y -= 8.0
//        titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
//
//
//        let desc = UILabel(frame: titleLabel!.frame)
//        desc.frame.origin.y += 20.0
//        desc.font = UIFont(name: "HelveticaNeue", size: 14.0)
//
//        desc.textColor = UIColor.white
//        titleLabel!.textColor = UIColor.white
//        addSubview(desc)
//
//        let imageName = groups[tag].icon
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image!)
//
//        imageView.frame = CGRect(x: (frame.width/2)-20, y: (frame.height/2)-20, width: 40, height: 40)
//        addSubview(imageView)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
