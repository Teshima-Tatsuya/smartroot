//
//  MyRouteTableViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class MyRouteTableViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet var routeTable: UITableView!
    
    var cellRouteTitle = ["広島", "東京"]
    
    var cellRouteImage = ["testImage.jpg", "testImage.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellRouteTitle.count
        
    }
    
    //cellの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = routeTable.dequeueReusableCellWithIdentifier("Route", forIndexPath: indexPath)
        
        //cellに画像を追加(viewWithTagはストーリーボードで設定)
        let img = UIImage(named: "\(cellRouteImage[indexPath.row])")
        let cellImg = routeTable.viewWithTag(1) as! UIImageView
        cellImg.image = img
        
        //cellにタイトルを追加
        let title = routeTable.viewWithTag(2) as! UILabel
        title.text? = "\(cellRouteTitle[indexPath.row])"
        
        
        return cell
    
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

