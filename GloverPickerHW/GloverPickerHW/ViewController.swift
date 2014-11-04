//
//  ViewController.swift
//  GloverPickerHW
//
//  Created by Danny Glover on 11/3/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var colorLabel: UILabel!
    let pickerData = ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"]
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let string:NSString = pickerData[row] as NSString
        let color = getColorFromString(string)
        colorLabel.text = string
        colorLabel.textColor = color
        //background color to check width
        //colorLabel.backgroundColor = UIColor.grayColor()
    }
    
    func getColorFromString(inputString: NSString)-> UIColor{

        //default black
        var color:UIColor = UIColor.blackColor()
        
        if inputString == "Red" {
            color = UIColor.redColor()
        }
        
        if inputString == "Orange" {
            color = UIColor.orangeColor()
        }
        
        if inputString == "Yellow" {
            color = UIColor.yellowColor()
        }
        
        if inputString == "Green" {
            color = UIColor.greenColor()
        }
        
        if inputString == "Blue" {
            color = UIColor.blueColor()
        }
        
        if inputString == "Violet" {
            color = UIColor.purpleColor()
        }
        if inputString == "Indigo" {
            //seems like converting hext to color should be easier
            let rgbValue = 0x4B0082
            let r = CGFloat((rgbValue & 0xFF0000) >> 16)/255.0
            let g = CGFloat((rgbValue & 0xFF00) >> 8)/255.0
            let b = CGFloat((rgbValue & 0xFF))/255.0
            color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        }
        return color
    }
    
    override func viewDidLoad() {
        pickerView(colorPicker, didSelectRow: 0, inComponent: 0)
        colorPicker.dataSource = self
        colorPicker.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

