//
//  SearchRouteResult.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit

class SearchRouteResultController: UIViewController {
    
  
    @IBOutlet weak var RouteResult1: UILabel!
    
    @IBOutlet weak var RouteResult2: UILabel!
    @IBOutlet weak var RouteResult3: UILabel!
    @IBOutlet weak var RouteResult4: UILabel!
    
    var Route1:String = ""
    var Route2:String = ""
    var Route3:String = ""
    var Route4:String = ""
    var Route5:String = ""
    var Route6:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.RouteResult1.text = self.Route1
        self.RouteResult2.text = self.Route2
        self.RouteResult3.text = self.Route3
        self.RouteResult4.text = self.Route4
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
