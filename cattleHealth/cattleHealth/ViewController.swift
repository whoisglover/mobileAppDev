//
//  ViewController.swift
//  cattleHealth
//
//  Created by Danny Glover on 10/23/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var textField: UITextField!
    var startDateOptional:NSDate?
    var stopDateOptional:NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func start(){
        startDateOptional = NSDate()
    }
    
    @IBAction func stop(){
        stopDateOptional = NSDate()
    }
    
    func submitReadingToHealthStore(){
        if startDateOptional != nil && stopDateOptional != nil {
            let breathCountString = textField.text as NSString
            let breathCount = breathCountString.doubleValue
            let startDate = startDateOptional!
            let stopDate = stopDateOptional!
            let timeInterval = stopDate.timeIntervalSinceDate(startDate)
            
        }
        startDateOptional = nil
        stopDateOptional = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

