//
//  MTViewController.h
//  UIKitDemo
//
//  Created by C. A. Beninati on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationBar *aNavigationBar;
@property (strong, nonatomic) IBOutlet UIImageView *anImageView;
@property (strong, nonatomic) IBOutlet UILabel *aLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *aSegmentControl;

- (IBAction)didChangeSegmentControl:(UISegmentedControl*)sender;

@end
