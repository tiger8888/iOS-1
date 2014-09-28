//
//  GenericViewController.m
//  LetsTab
//
//  Created by John Ray on 8/25/13.
//  Copyright (c) 2013 John Ray. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITabBarItem *barItem;

- (IBAction)incrementCountFirst:(id)sender;
- (IBAction)incrementCountSecond:(id)sender;
- (IBAction)incrementCountThird:(id)sender;

-(void)updateCounts;
-(void)updateBadge;

@end


@implementation GenericViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateCounts {
    NSString *countString;
    countString=[NSString stringWithFormat:
                 @"First: %d\nSecond: %d\nThird: %d",
                 ((CountingTabBarController *)self.parentViewController).firstCount,
                 ((CountingTabBarController *)self.parentViewController).secondCount,
                 ((CountingTabBarController *)self.parentViewController).thirdCount];
    self.outputLabel.text=countString;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateCounts];
}

-(void)updateBadge {
    NSString *badgeCount;
    int currentBadge;
    currentBadge=[self.barItem.badgeValue intValue];
    currentBadge++;
    badgeCount=[NSString stringWithFormat:@"%d",currentBadge];
    self.barItem.badgeValue=badgeCount;
}

- (IBAction)incrementCountFirst:(id)sender {
    ((CountingTabBarController *)self.parentViewController).firstCount++;
    [self updateBadge];
    [self updateCounts];
}

- (IBAction)incrementCountSecond:(id)sender {
    ((CountingTabBarController *)self.parentViewController).secondCount++;
    [self updateBadge];
    [self updateCounts];
}

- (IBAction)incrementCountThird:(id)sender {
    ((CountingTabBarController *)self.parentViewController).thirdCount++;
    [self updateBadge];
    [self updateCounts];
}

@end
