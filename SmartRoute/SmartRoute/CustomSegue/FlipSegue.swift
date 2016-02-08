//
//  FlipSegue.swift
//  SmartRoute
//
//  Created by 手嶋達也 on 2016/02/06.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class FlipSegue: UIStoryboardSegue {
    override func perform(){
        //ViewControllerのインスタンスを取得する
        let firstVCView = destinationViewController.view as UIView!
        let secondVCView = sourceViewController.view as UIView!
        
        // 画面の高さと幅を取得
        let screenWidth  = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
    }
}
