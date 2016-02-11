//
//  SearchRouteResult.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit
import Alamofire
import GoogleMaps

class SearchRouteResultController: UIViewController {
    
  
    @IBOutlet weak var RouteResult1: UILabel!
    
    @IBOutlet weak var RouteResult2: UILabel!
    @IBOutlet weak var RouteResult3: UILabel!
    @IBOutlet weak var RouteResult4: UILabel!
    
    var Route:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tmp: [String] = []
        tmp.append(Route[0])
        var params = [String: AnyObject]()
        
        for i in 1...5{
            if(Route[i] != ""){
                tmp.append(Route[i])
            }
        }
        if(tmp.count == 2){
            params["origin"] = tmp[0]
            params["destination"] = tmp[1]
        }else if(tmp.count > 2){
//            params["origin"] = tmp[0]
//            params["destination"] = tmp[tmp.count-1]
//            params["waypoints"] = tmp[1...tmp.count-2]
            params = [
                "origin":tmp[0],
                "destination":tmp[tmp.count-1],
            ]
            tmp.removeLast()
            tmp.removeAtIndex(0)
            params["waypoints"] = tmp

        }
        
        //params[]
        /*
        let params =
        [
            "origin":self.Route1,
            "destination":"福岡",
            "waypoints":["location":"長野","location":"静岡"]
        ]
        */
        
        Alamofire.request(.GET,"https://maps.googleapis.com/maps/api/directions/json?",parameters: params).responseJSON{ response in
            print(response)
            
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
