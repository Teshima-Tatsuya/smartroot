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
    
    var googleMap : GMSMapView!
    
    var locationManager:CLLocationManager! = nil
    
    //緯度経度 -> 金沢駅
    var latitude: CLLocationDegrees! = 36.5780574
    var longitude: CLLocationDegrees! = 136.6486596
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //位置情報を取得
        getLocation()
        locationManager.startUpdatingLocation()
        
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
        
        // 位置情報の許可ステータスを取得
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.NotDetermined) {
            self.locationManager.requestAlwaysAuthorization()
        }
        
        // 取得精度の設定.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 取得頻度の設定(ミリ秒).
        locationManager.distanceFilter = 100
    }
    
    // 位置情報取得に成功したときに呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 3
        if status == .AuthorizedWhenInUse {
            
            // 4
            locationManager.startUpdatingLocation()
            
            //5
            googleMap.myLocationEnabled = true
            googleMap.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // 7
            googleMap.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
            
            
            //マーカーの作成
            let marker: GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(manager.location!.coordinate.latitude, manager.location!.coordinate.longitude)
            marker.map = googleMap
        }
        
    }
    
    // 位置情報取得に失敗した時に呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager,didFailWithError error: NSError){
        print("位置情報取得に失敗しました")
    }
    
}