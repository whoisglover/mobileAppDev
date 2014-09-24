//
//  ViewController.m
//  ObjC 101
//
//  Created by Danny Glover on 9/23/14.
//  Copyright (c) 2014 Danny Glover. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *lightGrayViewConstraints;
@property (nonatomic, strong) NSArray *buttonConstraints;
@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) NSArray *segmentConstraints;
@end

@implementation ViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    [[self view] addSubview:[self lightGreyView]];
    [[self view] addConstraints:[self lightGrayViewConstraints]];
    
    [[self view] addSubview:[self segmentedControl]];
   // [[self view] addConstraints:[self segmentContstraints]];
    [[self view] addSubview:[self submitButton]];
    [[self view] addConstraints:[self buttonConstraints]];
}

- (UIView *)lightGreyView{
    if (!_lightGreyView) {
        _lightGreyView = [[UIView alloc] initWithFrame:CGRectZero];
        [_lightGreyView setTranslatesAutoresizingMaskIntoConstraints:NO];
        _lightGreyView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lightGreyView;
}

- (NSArray *) lightGrayViewConstraints{
    if(!_lightGrayViewConstraints){
        _lightGrayViewConstraints = @[[NSLayoutConstraint
                                      constraintWithItem:self.lightGreyView
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0f
                                      constant:0.0f],
                                      [NSLayoutConstraint
                                       constraintWithItem:self.lightGreyView
                                       attribute:NSLayoutAttributeRight
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeRight
                                       multiplier:1.0f
                                       constant:0.0f],
                                      [NSLayoutConstraint
                                       constraintWithItem:self.lightGreyView
                                       attribute:NSLayoutAttributeLeft
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeLeft
                                       multiplier:1.0f
                                       constant:0.0f],
                                      [NSLayoutConstraint
                                       constraintWithItem:self.lightGreyView
                                       attribute:NSLayoutAttributeBottom
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                       constant:0.0f]
                                      
                                      ];
    }
    return _lightGrayViewConstraints;
}


-(UIButton *)submitButton
{
    if(!_submitButton){
        _submitButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_submitButton setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [_submitButton setTitle:@"submit" forState:UIControlStateNormal];
    }
    return _submitButton;
}



- (NSArray *) buttonConstraints{
    if(!_buttonConstraints){
        _buttonConstraints = @[[NSLayoutConstraint
                                       constraintWithItem:self.submitButton
                                       attribute:NSLayoutAttributeCenterX
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.lightGreyView
                                       attribute:NSLayoutAttributeTop
                                       multiplier:1.0f
                                       constant:0.0f],
                                      [NSLayoutConstraint
                                       constraintWithItem:self.submitButton
                                       attribute:NSLayoutAttributeHeight
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                       attribute:NSLayoutAttributeRight
                                       multiplier:1.0f
                                       constant:0.0f],
                                      [NSLayoutConstraint
                                       constraintWithItem:self.submitButton
                                       attribute:NSLayoutAttributeWidth
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.segmentedControl
                                       attribute:NSLayoutAttributeWidth
                                       multiplier:1.0f
                                       constant:0.0f],
                                      [NSLayoutConstraint
                                       constraintWithItem:self.submitButton
                                       attribute:NSLayoutAttributeTop
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.segmentedControl
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                       constant:10.0f]
                                      
                                      ];
    }
    return _buttonConstraints;
}

- (UIView *) segmentedControl
{
    if(!_segmentedControl){
        
    }
    return _segmentedControl;

}


@end
