//
//  SecondViewController.swift
//  SmartRoot
//
//  Created by kazuki nishimura on 2016/01/13.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var pageMenu : CAPSPageMenu?
    
    var backColor :UIColor = UIColor.blackColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test")
        
        self.title = "PageMenu"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
        // 表示するコントローラー
        var controllerArray : [UIViewController] = []
        
        let controller1 = self.storyboard?.instantiateViewControllerWithIdentifier("test1")
        let controller2 = self.storyboard?.instantiateViewControllerWithIdentifier("test2")
        
        controllerArray.append(controller1!)
        controllerArray.append(controller2!)
        
        
        let parameters: [String: AnyObject] = ["scrollMenuBackgroundColor": backColor,
            "viewBackgroundColor": backColor,
            "selectionIndicatorColor": UIColor.orangeColor(),
            "bottomMenuHairlineColor": backColor,
            "menuItemFont": UIFont(name: "HelveticaNeue", size: 13.0)!,
            "menuHeight": 80.0,
            "menuItemWidth": 120.0,
            "centerMenuItems": true,
            "menuItemSeparatorWidth": 4.3   ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 50.0, self.view.frame.width, self.view.frame.height), options: parameters)
        
        self.view.addSubview(pageMenu!.view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

