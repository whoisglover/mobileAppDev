//
//  ViewController.swift
//  GloverImageViewHW
//
//  Created by Danny Glover on 11/7/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    var imageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "calvin.jpg")
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: image!.size)
        // Do any additional setup after loading the view, typically from a nib.
        var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped")
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        mainScrollView.addGestureRecognizer(doubleTapRecognizer)
        let scrollViewFrame = mainScrollView.frame
        let scaleWidth = scrollViewFrame.size.width / mainScrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / mainScrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        mainScrollView.minimumZoomScale = minScale
        mainScrollView.maximumZoomScale = 2.0
        mainScrollView.zoomScale = minScale
        centerScrollViewContents()
    }
    
    func centerScrollViewContents(){
        let boundsSize = mainScrollView.bounds.size
        var contentsFrame = imageView.frame
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2
        }else{
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2
        }else{
            contentsFrame.origin.y = 0.0
        }
        imageView.frame = contentsFrame
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer){
        let pointInView = recognizer.locationInView(imageView)
        var newZoomScale = mainScrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, mainScrollView.maximumZoomScale)
        let scrollViewSize = mainScrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w/2.0)
        let y = pointInView.y - (h/2.0)
        let rectToZoomTo = CGRectMake(x, y, w, h)
        mainScrollView.zoomToRect(rectToZoomTo, animated: true)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
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

