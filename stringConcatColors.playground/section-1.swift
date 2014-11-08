// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var blue = NSMutableAttributedString(string:"hello")

blue
blue.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSMakeRange(0, 3))
var red = UILabel()
red.text = "red text"
red.textColor = UIColor.redColor()

blue.length
