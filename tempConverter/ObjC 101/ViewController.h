//
//  ViewController.h
//  ObjC 101
//
//  Created by Danny Glover on 9/23/14.
//  Copyright (c) 2014 Danny Glover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIView *lightGreyView;
@property (nonatomic, strong) UIButton *submitButton;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property(nonatomic, getter=isSegmentZeroSet) BOOL segmentZeroSet;

@end

