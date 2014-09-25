//
//  Remote.swift
//  facebookLogin
//
//  Created by Danny Glover on 9/24/14.
//  Copyright (c) 2014 Danny Glover. All rights reserved.
//

import UIKit

class Remote: NSObject {
    var data = NSMutableData()
    
    func connect(query:NSString) {
        var url =  NSURL.URLWithString("http://localhost:")
        var request = NSURLRequest(URL: url)
        var conn = NSURLConnection(request: request, delegate: self, startImmediately: true)
    }
    
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        println("didReceiveResponse")
    }
    
    func connection(connection: NSURLConnection!, didReceiveData conData: NSData!) {
        self.data.appendData(conData)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        println(self.data)
    }
    
    
    deinit {
        println("deiniting")
    }
   
}
