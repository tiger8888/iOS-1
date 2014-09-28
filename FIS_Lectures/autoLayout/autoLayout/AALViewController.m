//
//  AALViewController.m
//  autoLayout
//
//  Created by Albert Lardizabal on 7/7/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"

@interface AALViewController ()

@property (weak, nonatomic) IBOutlet UIButton *myButton;

@end

@implementation AALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //
    [self.myButton removeConstraints:self.myButton.constraints];
    self.myButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.myButton.constraints];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:self.myButton
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:-50.0];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:self.myButton
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                    constant:0];
    
    [self.view addConstraints:@[xConstraint, yConstraint]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
