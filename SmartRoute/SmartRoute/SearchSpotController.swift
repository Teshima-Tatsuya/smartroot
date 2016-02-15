//
//  SpotSearchController.swift
//  SmartRoute
//
//  Created by kazuki nishimura on 2016/01/21.
//  Copyright © 2016年 kazuki nishimura. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class SearchSpotController: UIViewController,CLLocationManagerDelegate
{
    
    @IBOutlet var nav: UINavigationBar!
    
    @IBOutlet var searchSpot: UITextField!
    var googleMap : GMSMapView!
    
    var locationManager:CLLocationManager
    
    //緯度経度 -> 金沢駅
    var latitude: CLLocationDegrees = 36.5780574
    var longitude: CLLocationDegrees = 136.6486596
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 初期倍率
        let zoom: Float = 15
        
        // カメラ
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(latitude,longitude: longitude, zoom: zoom)
        
        // MapViewを生成
        
        googleMap = GMSMapView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        
        // MapViewにカメラを追加
        googleMap.camera = camera
        
        //マーカーの作成
        let marker: GMSMarker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
        marker.map = googleMap
        
        //viewにMapViewを追加.
        self.view.addSubview(googleMap)
        self.view.addSubview(nav)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getLocation() {
        // 現在地の取得
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        
    }
    
}