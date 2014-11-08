//
//  RealmTableViewController.swift
//  wowRealmTableView
//
//  Created by Danny Glover on 11/3/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit


class RealmTableViewController: UITableViewController {
    
    @IBOutlet var realmTableView: UITableView!
    @IBOutlet weak var regionSelector: UISegmentedControl!
    var tableData = []
    var euTableData = []
    var usTableData = []
    var krTableData = []
    var twTableData = []
    var cnTableData = []
    
    
    func getUSRealmsFromBattlenet(){
            let urlPath = "https://us.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
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
                let results:NSArray = jsonResult["realms"] as NSArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.usTableData = results
//                    self.realmTableView!.reloadData()
                })
            })
            task.resume()
    }
    
    func getEURealmsFromBattlenet(){
        let urlPath = "https://eu.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
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
            let results:NSArray = jsonResult["realms"] as NSArray
            dispatch_async(dispatch_get_main_queue(), {
                self.tableData = results
                self.realmTableView!.reloadData()
            })
        })
        task.resume()
    }
    
    func getKoreaRealmsFromBattlenet(){
        let urlPath = "https://kr.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
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
            let results:NSArray = jsonResult["realms"] as NSArray
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tableData = results
                self.realmTableView!.reloadData()
            })

        })
        task.resume()
    }
    
    func getTaiwanRealmsFromBattlenet(){

        let urlPath = "https://tw.api.battle.net/wow/realm/status?locale=en_US&apikey=fckpc2kcsjj8y785pk98p2ggqeuc9vwh"
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
            let results = jsonResult["realms"] as NSArray
            dispatch_async(dispatch_get_main_queue(), {
                self.tableData = results
                self.realmTableView!.reloadData()
            })

        })
        task.resume()
    }
    
    func getChinaRealmsFromBattlenet(){

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
            let results = jsonResult["realms"] as NSArray
            dispatch_async(dispatch_get_main_queue(), {
                self.tableData = results
                self.realmTableView!.reloadData()
            })
        })
        task.resume()
    }

//    func realmDataReceived(notification: NSNotification 
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTableData:", name: "realmDataUpdated", object: nil)
        getUSRealmsFromBattlenet()
        let dataFetcher:RealmDataFetcher = RealmDataFetcher()
        dataFetcher.getRealmsFromBattlenet("us")
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refersh")
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl!)
        dataFetcher.getRealmsFromBattlenet("eu")
        dataFetcher.getRealmsFromBattlenet("kr")
        dataFetcher.getRealmsFromBattlenet("tw")
        dataFetcher.getRealmsFromBattlenet("cn")
    }
    
    func updateTableData(notification:NSNotification){
        println("zomg notification received")
        var receivedDataDictionary = notification.userInfo!
        var region = receivedDataDictionary["region"] as String
        var data = receivedDataDictionary["data"] as NSArray
        switch region{
        case "us":
            usTableData = data
        case "eu":
            euTableData = data
        case "kr":
            krTableData = data
        case "tw":
            twTableData = data
        case "cn":
            cnTableData = data
        default:
            break
        }
        println(region)
    }
    


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        self.tableView.rowHeight = 44;
        var cell = tableView.dequeueReusableCellWithIdentifier("RealmCell", forIndexPath: indexPath) as RealmTableViewCell
        let rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        cell.metaData = rowData
        cell.realmTitle.text = rowData["name"] as? String
        let cellPlayType = rowData["type"] as? String
        let realmPopulation = rowData["population"] as? String
        
        if cellPlayType == "pve"{
            cell.realmPlayType.text = "PvE"
            cell.realmPlayType.textColor = UIColor(red:0.000000, green:0.392157, blue:0.121569, alpha:1.0)
        }
        else if(cellPlayType == "pvp"){
            cell.realmPlayType.text = "PvP"
            cell.realmPlayType.textColor = UIColor(red:0.850980, green:0.282353, blue:0.282353, alpha:1.0)
        }
        else if(cellPlayType == "rp"){
            cell.realmPlayType.text = "RP"
            cell.realmPlayType.textColor = UIColor(red:0.133333, green:0.411765, blue:0.537255, alpha:1.0)
        }
        
        if realmPopulation == "low"{
            cell.realmPopulation.text = "Low"
            cell.realmPopulation.textColor = UIColor(red:0.545098, green:0.850980, blue:0.239216, alpha:1.0)
        }else if(realmPopulation == "medium"){
            cell.realmPopulation.text = "Medium"
            cell.realmPopulation.textColor = UIColor.orangeColor()
        }else if(realmPopulation == "high"){
            cell.realmPopulation.text = "High"
            cell.realmPopulation.textColor = UIColor.redColor()
        }
        return cell
    }
    
//    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
//        let titles = ["a", "b", "c", "d", "e", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "y", "z"]
//        return titles
//    }
    
    func sectionForSectionIndexTitleAtIndex(indexTitleIndex: Int) -> Int{
        return 5
    }

   
    @IBAction func regionChanged(sender: UISegmentedControl) {
        switch regionSelector.selectedSegmentIndex{
        case 0:
            println("U.S. realm refresh")
            tableData = usTableData
            realmTableView!.reloadData()
        case 1:
            println("EU realm refresh")
            tableData = euTableData
            realmTableView!.reloadData()
            
        case 2:
            println("Korea realm refresh")
            tableData = krTableData
            realmTableView!.reloadData()
        case 3:
            println("Taiwan realm refresh")
            tableData = twTableData
            realmTableView!.reloadData()
        case 4:
            println("China realm refresh")
            tableData = cnTableData
            realmTableView!.reloadData()
        default:
            break;
        }
    }
    
    func refresh(sender: AnyObject){
        println("Refresh Pulled")
        switch regionSelector.selectedSegmentIndex{
        case 0:
            println("U.S. realm refresh")
            getUSRealmsFromBattlenet()
        case 1:
            println("EU realm refresh")
            getEURealmsFromBattlenet()
        case 2:
            println("Korea realm refresh")
            getKoreaRealmsFromBattlenet()
        case 3:
            println("Taiwan realm refresh")
            getTaiwanRealmsFromBattlenet()
        default:
            break;
        }
        self.refreshControl?.endRefreshing()
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        var realmDetail = segue.destinationViewController as RealmViewController
        var x = self.tableView.indexPathForSelectedRow()
        let row = x?.row
        let data = self.tableData[row!] as NSDictionary
        realmDetail.realmData = data

        // Pass the selected object to the new view controller.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
