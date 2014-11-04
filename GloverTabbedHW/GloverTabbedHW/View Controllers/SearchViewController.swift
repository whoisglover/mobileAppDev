//
//  SearchViewController.swift
//  GloverTabbedHW
//
//  Created by Danny Glover on 10/29/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButton(sender: AnyObject) {
        searchResultLabel.text = searchTextField.text
    }

}
