//
//  RealmViewController.swift
//  wowRealmTableView
//
//  Created by Danny Glover on 11/4/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class RealmViewController: UIViewController {

    var realmData:NSDictionary?
    @IBOutlet weak var realmTitle: UILabel!
    @IBOutlet weak var realmPlayType: UILabel!
    
    @IBOutlet weak var realmStatus: UILabel!
    @IBOutlet weak var realmPopulation: UILabel!
    @IBOutlet weak var realmBattleGroup: UILabel!
    
    @IBOutlet weak var tolBaradStatus: UILabel!
    @IBOutlet weak var tolBaradControlling: UILabel!
    @IBOutlet weak var tolBaradControllingImage: UIImageView!
    @IBOutlet weak var tolBaradNextBattleTime: UILabel!
    
    @IBOutlet weak var wintergraspStatus: UILabel!
    @IBOutlet weak var wintergraspControlling: UILabel!
    @IBOutlet weak var wintergraspControllingImage: UIImageView!
    @IBOutlet weak var wintergraspNextBattleTime: UILabel!
    
    
    
    
    
    let customGreen = UIColor(red:0.031373, green:0.619608, blue:0.266667, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //println(self.realmData?)
        realmTitle.text = realmData?["name"] as NSString
        if(realmData?["status"] as NSInteger == 1){
            realmStatus.text = "Online"
            realmStatus.textColor = customGreen
        }else if(realmData?["status"] as NSInteger == 0){
            realmStatus.text = "Offline/Down"
            realmStatus.textColor = UIColor.redColor()
        }
        if let playType = realmData?["type"] as? NSString{
            if playType == "pvp" {
                realmPlayType.text = "PvP"
                realmPlayType.textColor = UIColor.redColor()
            }else if playType == "pve"{
                realmPlayType.text = "PvE"
                realmPlayType.textColor = customGreen
            }else if playType == "rp"{
                realmPlayType.text = "RP"
                realmPlayType.textColor = UIColor.blueColor()
            }else{
                realmPlayType.text = "Type Unknown"
            }
            
        }
        if let pop = realmData?["population"] as? NSString{
            if(pop=="high"){
                realmPopulation.text = "High"
                realmPopulation.textColor = UIColor.redColor()
            }else if(pop=="medium"){
                realmPopulation.text = "Medium"
                realmPopulation.textColor = UIColor.orangeColor()
            }else if(pop=="low"){
                realmPopulation.text = "Low"
                realmPopulation.textColor = customGreen
            }else if(pop=="full"){
                realmPopulation.text = "Full"
                realmPopulation.textColor = UIColor.redColor()
            }else{
                realmPopulation.text = "Unknown"
            }
        }
        if let battlegroup = realmData?["battlegroup"] as? NSString{
            realmBattleGroup.text = battlegroup
        }
        if let wintergrasp = realmData?["wintergrasp"] as? NSDictionary{
            if let wgStatus = wintergrasp["status"] as? NSInteger{
                if wgStatus == 0{
                    wintergraspStatus.text = "Idle"
                }else if wgStatus == 1{
                    wintergraspStatus.text = "Populating"
                }else if wgStatus == 2{
                    wintergraspStatus.text = "Active"
                }else if wgStatus == 3{
                    wintergraspStatus.text = "Concluded"
                }else{
                    wintergraspStatus.text = "Unknown"
                }

            }
            if let wgControllingFaction = wintergrasp["controlling-faction"] as? NSInteger{
                switch wgControllingFaction{
                case 0:
                    wintergraspControlling.text = "Alliance"
                    wintergraspControlling.textColor = UIColor.blueColor()
                    wintergraspControllingImage.image = UIImage(named: "alliance_logo")
                case 1:
                    wintergraspControlling.text = "Horde"
                    wintergraspControlling.textColor = UIColor.redColor()
                    wintergraspControllingImage.image = UIImage(named: "horde_logo")
                case 2:
                    wintergraspControlling.text = "Neutral"
                default:
                    wintergraspControlling.text = "Unknown"
                }
            }
            if let wgNextBattle = wintergrasp["next"] as? Double{
                //divide by 1000 to make milliseconds seconds
                let secondsToBattle = NSDate(timeIntervalSince1970: wgNextBattle/1000)
                var form = NSDateFormatter()
                //println(NSLocale.availableLocaleIdentifiers())
                //println(NSTimeZone.knownTimeZoneNames())
                form.dateFormat = "h:mm a zzz"
                wintergraspNextBattleTime.text = form.stringFromDate(secondsToBattle)

            }
        }
        if let tolBarad = realmData?["tol-barad"] as? NSDictionary{
            if let tbStatus = tolBarad["status"] as? NSInteger{
                if tbStatus == 0{
                    tolBaradStatus.text = "Idle"
                }else if tbStatus == 1{
                    tolBaradStatus.text = "Populating"
                }else if tbStatus == 2{
                    tolBaradStatus.text = "Active"
                }else if tbStatus == 3{
                    tolBaradStatus.text = "Concluded"
                }else{
                    tolBaradStatus.text = "Unknown"
                }
            }
            if let tbControllingFaction = tolBarad["controlling-faction"] as? NSInteger{
                switch tbControllingFaction{
                case 0:
                    tolBaradControlling.text = "Alliance"
                    tolBaradControlling.textColor = UIColor.blueColor()
                    tolBaradControllingImage.image = UIImage(named: "alliance_logo")
                case 1:
                    tolBaradControlling.text = "Horde"
                    tolBaradControlling.textColor = UIColor.redColor()
                    tolBaradControllingImage.image = UIImage(named: "horde_logo")
                case 2:
                    tolBaradControlling.text = "Neutral"
                default:
                    tolBaradControlling.text = "Unknown"
                }
            }
            if let tbNextBattle = tolBarad["next"] as? Double{
                //divide by 1000 to make milliseconds seconds
                let secondsToBattle = NSDate(timeIntervalSince1970: tbNextBattle/1000)
                var form = NSDateFormatter()
                //println(NSLocale.availableLocaleIdentifiers())
                //println(NSTimeZone.knownTimeZoneNames())
                form.dateFormat = "h:mm a zzz"
                tolBaradNextBattleTime.text = form.stringFromDate(secondsToBattle)
                
            }
        }
        
    
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
