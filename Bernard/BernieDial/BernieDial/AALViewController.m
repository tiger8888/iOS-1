//
//  AALViewController.m
//  BernieDial
//
//  Created by Albert Lardizabal on 8/26/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"

@interface AALViewController ()

@end

@implementation AALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *phoneNumbers = @[@"2033395298",@"4142480086",@"2039184700"];
    
    for (NSString *phoneNumber in phoneNumbers) {
        NSString *numberToDial = [@"tel://" stringByAppendingString:phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:numberToDial]];
    }
    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
