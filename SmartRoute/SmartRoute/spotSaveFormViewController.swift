//
//  spotSaveFormViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/02/19.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit
import Eureka

class spotSaveFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section()
            <<< TextRow("TextFiled"){
                $0.placeholder = "ここに書いてね"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}