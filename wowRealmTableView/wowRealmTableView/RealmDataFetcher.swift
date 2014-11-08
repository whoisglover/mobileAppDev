//
//  RealmDataFetcher.swift
//  wowRealmTableView
//
//  Created by Danny Glover on 11/6/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import Foundation

class RealmDataFetcher {


var tableData = []
let notifName:String = "realmDataUpdated"
func getRealmsFromBattlenet(region: String){
    
    switch region{
    case "us":
        let urlPath = "https://us.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
    case "eu":
        let urlPath = "https://eu.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
    case "korea":
        let urlPath = "https://kr.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
    case "taiwan":
        let urlPath = "https://tw.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
    case "china":
        let urlPath = "https://www.battlenet.com.cn/api/wow/realm/status?apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
    default:
        let urlPath = "https://us.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
    }
    

    let urlPath = "https://www.battlenet.com.cn/api/wow/realm/status?apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
    let url = NSURL(string: urlPath)
    let session = NSURLSession.sharedSession()
    
    let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
        println("Task completed")
        if(error != nil) {
            // If there is an error in the web request, print it to the console
            println(error.localizedDescription)
        }
        var err: NSError?
        
        var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
        if(err != nil) {
            // If there is an error parsing JSON, print it to the console
            println("JSON Error \(err!.localizedDescription)")
        }
        var stringy = jsonResult["realms"]?[0]["name"] as NSString
        println(stringy)
        let results: NSMutableArray = jsonResult["realms"]! as NSMutableArray
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = results
            var passbackData = ["data": results, "region": region]
            NSNotificationCenter.defaultCenter().postNotificationName("realmDataUpdated", object: self, userInfo: passbackData)
        })
    })
    task.resume()
}
}