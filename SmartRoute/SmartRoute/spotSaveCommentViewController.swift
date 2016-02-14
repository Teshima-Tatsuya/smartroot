//
//  spotSaveCommentViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/02/02.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit
let closeButton = UIButton(frame: CGRectMake(10, 5, 70, 30))
let photoImage = UIImage(named: "photo")
let photoButton = UIButton(frame: CGRectMake(70, 5, 70, 30))

class spotSaveCommentViewController: UIViewController, UITextViewDelegate{
    
    @IBOutlet var spotSaveComment: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spotSaveComment.delegate = self
        
        addKey()
        
        
    }
    
    func addKey(){
        
        let width = UIScreen.mainScreen().bounds.width
        
        let myKeyboard = UIView(frame: CGRectMake(0, 0, width, 40))
        myKeyboard.backgroundColor = UIColor.whiteColor()
        
        //完了ボタンの設定
        closeButton.backgroundColor = UIColor.darkGrayColor()
        closeButton.setTitle("閉じる", forState: .Normal)
        closeButton.layer.cornerRadius = 2.0
        closeButton.addTarget(self, action: "onClickCloseButton:", forControlEvents: .TouchUpInside)
        myKeyboard.addSubview(closeButton)
        
        spotSaveComment.inputAccessoryView = myKeyboard
        
        
    }
    
    func onClickCloseButton (sender: UIButton){
        
        self.view.endEditing(true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    @IBAction func backFromSpotSavePhotoView(segue:UIStoryboardSegue){
        
    }
    
    
}
