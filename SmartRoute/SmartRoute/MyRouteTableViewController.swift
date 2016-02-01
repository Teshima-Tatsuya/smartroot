//
//  MyRouteTableViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class MyRouteTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table:UITableView!
    
    
    let routeImage: NSArray = ["testImage.jpg","testImage.jpg"]
    
    let routeTitle: NSArray = ["広島","東京"]
    
    var selectedRouteImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routeImage.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        let img = UIImage(named:"\(routeImage[indexPath.row])")
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        
        // Tag番号 2 で UILabel インスタンスの生成
        let label2 = table.viewWithTag(2) as! UILabel
        label2.text = "\(routeTitle[indexPath.row])"
        
        
        return cell
    }
    
    // Cell が選択された場合
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedRouteImage = UIImage(named:"\(routeImage[indexPath.row])")
        if selectedRouteImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toRouteCell",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toRouteCell") {
            let subVC: MyRouteViewController = (segue.destinationViewController as? MyRouteViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedRouteImg = selectedRouteImage
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func unwindToSubject(segue:UIStoryboardSegue){
        print(segue.identifier)
    }
    
    
}

