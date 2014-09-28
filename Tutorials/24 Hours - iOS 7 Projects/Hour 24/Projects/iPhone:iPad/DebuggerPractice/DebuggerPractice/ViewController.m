//
//  ViewController.m
//  DebuggerPractice
//
//  Created by John Ray on 10/5/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSString *)describeInteger:(int)i {
    if (i % 2 == 0) {
        return @"even";
    } else {
        return @"odd";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *description;
    
    NSLog(@"Start");
    for (int i = 1;i <= 2000;i++) {
        description = [self describeInteger:i];
        NSLog(@"Variables: i - %d and description - %@", i, description);
        NSLog(@"----");
    }
    NSLog(@"Done");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
