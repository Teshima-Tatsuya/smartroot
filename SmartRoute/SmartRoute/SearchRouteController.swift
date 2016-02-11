//
//  SearchRouteController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//
import Alamofire
import UIKit
import GoogleMaps

class SearchRouteController: UIViewController {
    
    @IBOutlet weak var RouteTextField1: UITextField!
    
    
    @IBOutlet weak var RouteTextField2: UITextField!
    
    @IBOutlet weak var RouteTextField3: UITextField!
    
    @IBOutlet weak var RouteTextField4: UITextField!
    
    @IBOutlet weak var RouteTextField5: UITextField!
    
    @IBOutlet weak var RouteTextField6: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    * 画面遷移
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let SearchRouteResult:SearchRouteResultController = segue.destinationViewController as! SearchRouteResultController
        let routearray:[String]=[RouteTextField1.text!,RouteTextField2.text!,RouteTextField3.text!,RouteTextField4.text!,RouteTextField5.text!,RouteTextField6.text!]
        
        SearchRouteResult.Route = routearray
        
/*
        SearchRouteResult.Route1 = RouteTextField1.text!
        SearchRouteResult.Route2 = RouteTextField2.text!
        SearchRouteResult.Route3 = RouteTextField3.text!
        SearchRouteResult.Route4 = RouteTextField4.text!
        SearchRouteResult.Route5 = RouteTextField5.text!
        SearchRouteResult.Route6 = RouteTextField6.text!
*/
    }
    
    /*
    * SearchRouteResultControllerから戻ってきた時の処理
    */
    
    @IBAction func backFromSecondView(segue:UIStoryboardSegue){
        NSLog("SearchRouteController#backSearchRouteResultController")
    }

    
}
