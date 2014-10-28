//
//  SearchViewController.swift
//  TabbyExample
//
//  Created by Danny Glover on 10/28/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchLabel.text = "Search"
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
