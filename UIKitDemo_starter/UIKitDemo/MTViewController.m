//
//  MTViewController.m
//  UIKitDemo
//
//  Created by C. A. Beninati on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MTViewController.h"

@interface MTViewController () {
    NSArray *imagesArray;
    NSArray *titlesArray;
}

@end

@implementation MTViewController
@synthesize aNavigationBar;
@synthesize anImageView;
@synthesize aLabel;
@synthesize aSegmentControl;

- (void)setupData {
    imagesArray = [NSArray arrayWithObjects:@"red_rocks.jpg", @"tree.jpg", @"truck.jpg", nil];
    titlesArray = [NSArray arrayWithObjects:@"Red Rocks", @"A Tree", @"A Truck", nil];
}

- (void)viewDidLoad
{
    // build arrays for images and titles
    [self setupData];
        
    // start app with first segment selected
    [self didChangeSegmentControl:aSegmentControl];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setANavigationBar:nil];
    [self setAnImageView:nil];
    [self setALabel:nil];
    [self setASegmentControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)didChangeSegmentControl:(UISegmentedControl*)sender {
    [anImageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:[sender selectedSegmentIndex]]]];
    
    [aLabel setText:[titlesArray objectAtIndex:[sender selectedSegmentIndex]]];
}
@end
