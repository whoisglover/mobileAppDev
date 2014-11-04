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
    var tableData = []
    
    func getRealmsFromBattlenet(){
       
        
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
                var stringy = jsonResult["realms"]![0]["name"] as NSString
                println(stringy)
                let results: NSArray = jsonResult["realms"]! as NSArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableData = results
                    self.realmTableView!.reloadData()
                })
            })
            task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRealmsFromBattlenet()
//        self.tableView.dequeueReusableCellWithIdentifier("Cell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return tableData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        cell.textLabel.text = rowData["name"] as? String
        let cellPlayType = rowData["type"] as? String
        println(cellPlayType)
        if cellPlayType == "pve"{
            cell.backgroundColor = UIColor(red:0.776471, green:0.949020, blue:0.400000, alpha:1.0)
        }
        else if(cellPlayType == "pvp"){
             cell.backgroundColor = UIColor(red:0.850980, green:0.282353, blue:0.282353, alpha:1.0)
        }
        else if(cellPlayType == "rp"){
            cell.backgroundColor = UIColor(red:0.133333, green:0.411765, blue:0.537255, alpha:1.0)
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
