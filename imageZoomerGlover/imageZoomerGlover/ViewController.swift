//
//  ViewController.swift
//  imageZoomerGlover
//
//  Created by Danny Glover on 11/7/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        let image:UIImage! = UIImage(named: "calvin.jpg")
        imageView = UIImageView(image: image)
        var size = image.size
        
        self.imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: image!.size)
    
        
        scrollView.addSubview(imageView)
        scrollView.contentSize = image!.size
        
        var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 2.0
        scrollView.zoomScale = minScale
        centerScrollViewContents()
    }

    
    func centerScrollViewContents(){
        let boundSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        if contentsFrame.size.width < boundSize.width{
            contentsFrame.origin.x = (boundSize.width - contentsFrame.size.width) / 2.0
        }else{
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundSize.height{
            contentsFrame.origin.y = (boundSize.height - contentsFrame.size.height) / 2.0
        }else{
            contentsFrame.origin.y = 0.0
        }
        imageView.frame = contentsFrame
    
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer){
        
        
        let pointInView = recognizer.locationInView(imageView)
        var newZoomScale = scrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w/2.0)
        let y = pointInView.y - (h/2.0)
        let rectZoomTo = CGRectMake(x, y, w, h)
        
        scrollView.zoomToRect(rectZoomTo, animated: true)
        
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView!{
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView!) {
        centerScrollViewContents()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

