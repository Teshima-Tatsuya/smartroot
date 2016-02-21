//
//  spotSaveFormViewController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/02/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit
import Eureka

class spotSaveFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像の設定。
        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRectMake(0, 0, 34, 34)
        }
        
        
        form +++ Section()
            
            
            <<< TextRow("TextField"){
                $0.title = "タイトル"
                $0.placeholder = "タイトルを入力してください"
            }
            
             +++ Section()
            
            <<< ImageRow(){
                $0.title = "タップして写真を選択"
            
            }
            
             +++ Section()
            
            <<< TextAreaRow("TextArea"){
                $0.placeholder = "ここに書いてね"
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

