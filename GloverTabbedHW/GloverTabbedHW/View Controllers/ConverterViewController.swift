//
//  ConverterViewController.swift
//  GloverTabbedHW
//
//  Created by Danny Glover on 10/29/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var farenheitValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func convertButton(sender: AnyObject) {
        let input = inputField.text as NSString
        //convert input to double
        let tempDouble: Double = input.doubleValue
        let farenheitValue = (tempDouble * 1.8) + 32.0
        let farenheitString = NSString(format: "%.2f", farenheitValue)
        farenheitValueLabel.text =   farenheitString
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
