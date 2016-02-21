//
//  MyPageViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var mySegumentedControl: UISegmentedControl!
    
    @IBOutlet var myTableView: UITableView!
    
    let mySpot:[String] = ["広島", "東京"]
    let myRoute:[String] = ["オススメのラーメン屋", "広島観光ルート"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        var myContents = 0
        
        switch(mySegumentedControl.selectedSegmentIndex)
        {
        case 0:
            myContents = mySpot.count
            break
            
        case 1:
            myContents = myRoute.count
            break
            
        default:
            break
        
        }
        
        return myContents
    
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let myCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        switch(mySegumentedControl.selectedSegmentIndex)
        {
        case 0:
            myCell.textLabel!.text = mySpot[indexPath.row]
            break
        
        case 1:
            myCell.textLabel!.text = myRoute[indexPath.row]
            break
            
        default:
            break
        
        }
        
        return myCell
    
    
    }
    
    
    @IBAction func segumentedControllerActionChanged(sender: AnyObject) {
        
        myTableView.reloadData()
        
    }
    
    
}

