//
//  ViewController.m
//  Counting
//
//  Created by John Ray on 10/5/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Starting my count...\n");
    for (int x=0;x<500;x++) {
        NSLog(@"Counting: %d\n",x);
    }
    NSLog(@"All done!\n");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
