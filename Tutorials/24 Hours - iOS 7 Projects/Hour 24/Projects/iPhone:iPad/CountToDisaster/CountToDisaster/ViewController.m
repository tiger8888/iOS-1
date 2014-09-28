//
//  ViewController.m
//  CountToDisaster
//
//  Created by John Ray on 10/5/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak,nonatomic) NSTimer *theTimer;
@property (strong,nonatomic) NSMutableString *theString;
@end

@implementation ViewController

- (void)viewDidLoad
{
    self.theString=[NSMutableString stringWithString:@"Hello World"];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.theTimer=[NSTimer scheduledTimerWithTimeInterval:1.0
                                               target:self
                                             selector:@selector(countUp)
                                             userInfo:nil
                                              repeats:YES];
}

- (void)countUp {
    [self.theString appendString:self.theString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
