//
//  spotSaveCommentViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/02/02.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class spotSaveCommentViewController: UIViewController, UITextViewDelegate{
    
    @IBOutlet var spotSaveComment: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spotSaveComment.delegate = self 
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    
}
