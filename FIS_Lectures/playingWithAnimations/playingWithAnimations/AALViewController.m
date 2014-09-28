//
//  AALViewController.m
//  playingWithAnimations
//
//  Created by Albert Lardizabal on 7/9/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"

@interface AALViewController ()

@property (strong, nonatomic) IBOutlet UIView *greenBox;
@property (nonatomic) NSLayoutConstraint *boxY;

@end

@implementation AALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.greenBox removeConstraints:self.greenBox.constraints];
    
    self.greenBox.translatesAutoresizingMaskIntoConstraints  = NO;
    
    NSLayoutConstraint *greenBoxCenterX = [NSLayoutConstraint constraintWithItem:self.greenBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.view addConstraint:greenBoxCenterX];
    
    self.boxY = [NSLayoutConstraint constraintWithItem:self.boxY attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    [self.view addConstraint:self.boxY];
    
    NSLayoutConstraint *greenBoxHeight = [NSLayoutConstraint constraintWithItem:self.greenBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    [self.view addConstraint:greenBoxHeight];
    
    NSLayoutConstraint *greenBoxWidth = [NSLayoutConstraint constraintWithItem:self.greenBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    [self.view addConstraint:greenBoxWidth];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) animate:(id)sender {
    
    [UIView animateWithDuration:5.0 animations:^{
        self.boxY.constant = -800;
        [self.view layoutIfNeeded];
    }];
}

@end
