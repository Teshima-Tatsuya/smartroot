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
import SwiftyJSON

class SearchRouteResultController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
     // 画面遷移受け取りよう変数
    var Route:[String] = []
    
    var StepArticles:[[String: JSON]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 画面背に元からのデータを受け取る
        
        var tmp: [String] = []
        tmp.append(Route[0])

        // API送信用データ初期化
        var params = [String: AnyObject]()
        
        // [仮]まず全テキストフィールドからデータを全部取り込む
        for i in 1...5{
            if(Route[i] != ""){
                tmp.append(Route[i])
            }
        }
        // [仮]2つしかない場合はwaypoints無しVerでパラメータ作成
        if(tmp.count == 2){
            params["origin"] = tmp[0]
            params["destination"] = tmp[1]
        }else if(tmp.count > 2){    // 2つ以上はwaypoints入り
            params = [
                "origin":tmp[0],
                "destination":tmp[tmp.count-1],
            ]
            // [仮]出発地と終着点を削除した残りが全て経由地点
            tmp.removeLast()
            tmp.removeAtIndex(0)
            params["waypoints"] = tmp

        }
        params["language"] = "ja"
        
        // google direction api にリクエストとレスポンス受信
        Alamofire.request(.GET,"https://maps.googleapis.com/maps/api/directions/json?",parameters: params).responseJSON{ response in
//            print(response)
            // 受け取ったら即座にエラー調査した後SwiftyJSONでJSON形式を整える
            guard let objects = response.result.value else {
                return
            }
            let tmpdata = JSON(objects)
            let mapdata = tmpdata["routes"][0]["legs"][0]["steps"]
            // 経路一覧を作成するための処理 TODO 作成中
//            print(mapdata["start_address"])
            
            for i in 0...mapdata.count-1{
                let tmpmap = mapdata[i]
                var article: [String:JSON] = [
                    "html": tmpmap["html_instructions"]
                ]
                article["distance"] = tmpmap["distance"]
                article["maneuver"] = tmpmap["maneuver"]
                article["start"] = tmpmap["start_location"]
                article["travel_mode"] = tmpmap["travel_mode"]
                article["end"] = tmpmap["end_location"]
                article["duration"] = tmpmap["duration"]
                article["polyline"] = tmpmap["polyline"]
                
                self.StepArticles.append(article)
            //print(mapdata["routes"][0]["legs"][0]["steps"][i])
                
            }
            
//            print(self.StepArticles)
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.StepArticles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomViewCell", forIndexPath: indexPath)
        
        let title = tableView.viewWithTag(1) as! UILabel!
        title.text = self.StepArticles[indexPath.row]["html"]!.string
        let htmltmp = title.text!.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!
        let options:[String:String] = [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType]
        title.attributedText = try? NSAttributedString(data:htmltmp,options:options,documentAttributes:nil)
        
        let routeText = tableView.viewWithTag(2) as! UILabel
        routeText.text = self.StepArticles[indexPath.row]["duration"]!["text"].string
        let addInfo = tableView.viewWithTag(3) as! UILabel
        addInfo.text = self.StepArticles[indexPath.row]["distance"]!["text"].string
        print(title.text)
        print(routeText.text)
        print(addInfo.text)
        print(self.StepArticles[indexPath.row]["html"]!.string)
        print(self.StepArticles[indexPath.row]["duration"]!["text"].string)
        print(self.StepArticles[indexPath.row]["distance"]!["text"].string)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backFromGoogleMapRoute(segue:UIStoryboardSegue){
        NSLog("SearchRouteResultController#backGoogleMapRouteController")
    }
}
