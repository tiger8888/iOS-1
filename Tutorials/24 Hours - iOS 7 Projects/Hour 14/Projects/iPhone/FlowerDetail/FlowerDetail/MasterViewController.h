//
//  MasterViewController.h
//  FlowerDetail
//
//  Created by John Ray on 10/16/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
