//
//  ViewController.swift
//  GloverMyPicker
//
//  Created by Danny Glover on 10/30/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var dataSetPicker: UIPickerView!
    @IBOutlet weak var selectedItem: UILabel!
    
    let pickerData = ["Lowest to Highest", "Highest to Lowest", "Maximum Values", "Minimum Values", "Most Recent", "Least Recent"]
    
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
        selectedItem.text = pickerData[row]
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSetPicker.delegate = self
        dataSetPicker.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

