//
//  AddWorkoutVC.swift
//  GymBuddy
//
//  Created by Anes Hasicic on 15/11/2017.
//  Copyright © 2017 Anes Hasicic. All rights reserved.
//

import UIKit

class AddWorkoutVC: UIViewController {

    @IBOutlet weak var addWorkoutButton: UIButton!
    public var dataViewCtl: DataViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        addWorkoutButton.layer.cornerRadius = 3.0
    }

    @IBAction func didPressAddWorkoutButton(_ sender: UIButton) {
        dataViewCtl?.exerciseToAdd = Exercise(id: 1, name: "Flat Bench Press", bgColor: UIColor(red: 118/255, green: 187/255, blue: 82/255, alpha: 1.0).cgColor, icon: "arm-icon.png")
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.down:
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
