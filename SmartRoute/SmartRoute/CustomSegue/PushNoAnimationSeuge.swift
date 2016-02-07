//
//  PushNoAnimationSeuge.swift
//  SmartRoute
//
//  Created by 手嶋達也 on 2016/02/06.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class PushNoAnimationSegue: UIStoryboardSegue {
    override func perform(){
        self.sourceViewController.navigationController??.pushViewController(
            self.destinationViewController as UIViewController,
            animated: false
        )
    }
}
