//
//  WorkoutDetailVC.swift
//  GymBuddy
//
//  Created by Anes Hasicic on 13/11/2017.
//  Copyright © 2017 Anes Hasicic. All rights reserved.
//

import UIKit

class WorkoutDetailVC: UIViewController, UITableViewDataSource {

    var workout: Exercise?
    var sets: [Set] = [] {
        didSet {
            if sets.count == 0 {
                emptyLogLabel.isHidden = false
            } else {
                emptyLogLabel.isHidden = true
            }
        }
    }
    
    var initialformViewBottom: CGFloat = 0.0
    
    @IBOutlet weak var emptyLogLabel: UILabel!
    @IBOutlet weak var countInput: UITextField!
    @IBOutlet weak var kiloInput: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var logSetButton: UIButton!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var logSetButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var formViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.dataSource = self
        sets = []
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        logSetButton.layer.shadowOffset = CGSize(width:0, height:-1);
        logSetButton.layer.shadowRadius = 1;
        logSetButton.layer.shadowOpacity = 0.3;
        
        initialformViewBottom = formViewBottomConstraint.constant
        logSetButtonBottomConstraint.constant = -100.0
        formViewBottomConstraint.constant = -268.0
        
//        formView.layer.shadowOffset = CGSize(width:0, height:-2);
//        formView.layer.shadowRadius = 2;
//        formView.layer.shadowOpacity = 0.5;
    }
    
    @IBAction func didPressLogSetButton(_ sender: UIButton) {
        logSetButtonBottomConstraint.constant = -100.0
        formViewBottomConstraint.constant = -268.0
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
            }) { (done) in
            self.sets.append(Set(reps: 8, weight: 80.25))
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: self.sets.count-1, section: 0)], with: .fade)
            self.tableView.endUpdates()
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let label = header!.viewWithTag(3) as! UILabel
        label.text = workout!.name
        
        let imgView = header!.viewWithTag(2) as! UIImageView
        imgView.image = UIImage(named: workout!.icon)
    }

    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.down:
                dismiss(animated: true, completion: nil)
            case UISwipeGestureRecognizerDirection.up:
                
                self.formViewBottomConstraint.constant = initialformViewBottom
                UIView.animate(withDuration: 0.55, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
                                
                self.logSetButtonBottomConstraint.constant = 0.0
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wourkout-cell")!
        cell.selectionStyle = .none
        
        let cellView = cell.contentView.viewWithTag(1)!
        cellView.layer.cornerRadius = 3.0
        cellView.layer.masksToBounds = false;
        cellView.layer.shadowOffset = CGSize(width:1, height:1);
        cellView.layer.shadowRadius = 1.5;
        cellView.layer.shadowOpacity = 0.1;
        
        cellView.layer.backgroundColor = UIColor(cgColor: workout!.bgColor).adjust(by: abs(5))?.cgColor

        let label = cell.contentView.viewWithTag(1)!.viewWithTag(2)! as! UILabel
        label.text = "\(sets[indexPath.item].reps) x \(sets[indexPath.item].weight) kg"
        
        let indexLabel = cell.contentView.viewWithTag(1)!.viewWithTag(3)! as! UILabel
        indexLabel.text = "\(indexPath.item+1)"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sets.count
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
