//
//  DataViewController.swift
//  GymBuddy
//
//  Created by Anes Hasicic on 13/11/2017.
//  Copyright © 2017 Anes Hasicic. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyWorkoutLabel: UILabel!
    
    public var exerciseToAdd: Exercise? {
        didSet {
          
            emptyWorkoutLabel?.isHidden = true
            self.dataObject.workout.addExercise(e: exerciseToAdd!)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: dataObject.workout.exercises.count-1, section: 0)], with: .fade)
            self.tableView.endUpdates()
            
        }
    }
    
    var dataObject: WorkoutDay = WorkoutDay(day: "Monday") {
        didSet {
            if dataObject.workout.exercises.count == 0 {
                emptyWorkoutLabel?.isHidden = false
            } else {
                emptyWorkoutLabel?.isHidden = true
            }
        }
    }

    var addView: UILabel = UILabel()
    
    override func viewDidLoad() {
        
        if dataObject.workout.exercises.count == 0 {
            emptyWorkoutLabel?.isHidden = false
        } else {
            emptyWorkoutLabel?.isHidden = true
        }
        
        super.viewDidLoad()
        tableView.alwaysBounceHorizontal = false
        tableView.dataSource = self
        tableView.delegate = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.clear
        addView = UILabel(frame: refreshControl.bounds)
        addView.frame.size.width = view.frame.size.width
        addView.font = UIFont(name: "HelveticaNeue-Thin", size: 16.0)
        addView.text = "Keep pulling to add exercise"
        addView.textAlignment = .center
        addView.textColor = UIColor.white
        addView.backgroundColor = view.backgroundColor!
        refreshControl.addSubview(addView)
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.backgroundView = refreshControl
        }
        
        tableView.contentSize = CGSize(width: tableView.frame.size.width, height: tableView.contentSize.height)
        tableView.reloadData()
        
//        workouts = [
//            Exercise(name:"Flat Bench Press", bgColor: UIColor(red: 72/255, green: 100/255, blue: 182/255, alpha: 1.0).cgColor, icon: "dumbbell"),
//            Exercise(name:"Incline Bench Press", bgColor: UIColor(red: 118/255, green: 187/255, blue: 82/255, alpha: 1.0).cgColor, icon: "gym"),
//            Exercise(name:"Barbell Row", bgColor: UIColor(red: 191/255, green: 161/255, blue: 54/255, alpha: 1.0).cgColor, icon: "weightlifting"),
//            Exercise(name:"Deadlift", bgColor: UIColor(red: 178/255, green: 92/255, blue: 60/255, alpha: 1.0).cgColor, icon: "gym"),
//        ]
    }

    @objc func refresh(_ refreshControl: UIRefreshControl) {
        let addVC = storyboard?.instantiateViewController(withIdentifier: "addWorkoutVC") as! AddWorkoutVC
        addVC.dataViewCtl = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            self.present(addVC, animated: true) {
                refreshControl.endRefreshing()
            }
        }
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var refreshBounds: CGRect
        
        if #available(iOS 10.0, *) {
            refreshBounds = (tableView.refreshControl?.frame)!
        } else {
            refreshBounds = (tableView.backgroundView?.frame)!
        }
        
        let delta = -refreshBounds.origin.y - addView.frame.height
        
        addView.frame.origin.y = delta
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject.day
    }
    
    // MARK: - Table view delegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! WorkoutDetailVC
        detailVC.view!.layer.backgroundColor = dataObject.workout.exercises[indexPath.item].bgColor
        detailVC.workout = dataObject.workout.exercises[indexPath.item]
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            self.present(detailVC, animated: true)
        }
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wourkout-cell")!
        cell.selectionStyle = .none
        
        let cellView = cell.contentView.viewWithTag(1)!
        cellView.layer.cornerRadius = 3.0
        cellView.layer.masksToBounds = false;
        cellView.layer.shadowOffset = CGSize(width:1, height:1);
        cellView.layer.shadowRadius = 1;
        cellView.layer.shadowOpacity = 0.3;
        cellView.layer.backgroundColor = dataObject.workout.exercises[indexPath.item].bgColor
        
        let label = cell.contentView.viewWithTag(1)!.viewWithTag(2)! as! UILabel
        label.text = dataObject.workout.exercises[indexPath.item].name
        
        let imgView = cell.contentView.viewWithTag(1)!.viewWithTag(3)! as! UIImageView
        imgView.image = UIImage(named: dataObject.workout.exercises[indexPath.item].icon)
        
        return cell
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataObject.workout.exercises.count
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

