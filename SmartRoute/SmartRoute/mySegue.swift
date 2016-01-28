//
//  mySegue.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/27.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class mySegue: UIStoryboardSegue {
    override func perform() {
        // Assign the source and destination views to local variables.
        let firstVCView = self.sourceViewController.view as UIView!
        let secondVCView = self.destinationViewController.view as UIView!
        
        // Get the screen width and height.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        secondVCView.frame = CGRectMake(screenWidth, 0.0, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)

        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            //遷移前のビューを現在の位置から画面幅分移動する
            firstVCView.frame = CGRectOffset(firstVCView.frame, -screenWidth, 0.0)
            //遷移後のビューを現在の位置(画面外)から画面幅分移動する
            secondVCView.frame = CGRectOffset(secondVCView.frame, -screenWidth, 0.0)
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as UIViewController,
                    animated: false,
                    completion: nil)
        }
        
    }
}
