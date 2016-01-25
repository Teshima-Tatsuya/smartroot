//
//  MyRouteViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class MyRouteViewController: UIViewController {
    
    @IBOutlet var cellImg: UIImageView!
    var routeSelectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cellImg.image = routeSelectedImage
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        cellImg.contentMode = UIViewContentMode.ScaleAspectFit

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

