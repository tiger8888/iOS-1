//
//  AALViewController.m
//  Margaret
//
//  Created by Albert Lardizabal on 7/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"
#import <Venmo-iOS-SDK/Venmo.h>

@interface AALViewController ()

@end

@implementation AALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[Venmo sharedInstance] requestPermissions:@[VENPermissionMakePayments,
                                                 VENPermissionAccessProfile]
                         withCompletionHandler:^(BOOL success, NSError *error) {
                             if (success) {
                                 // :)
                             }
                             else {
                                 // :(
                             }
                         }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
