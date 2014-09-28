//
//  AALDetailViewController.h
//  PackingList
//  Item List
//
//  Created by Albert Lardizabal on 6/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AALMainTableViewController.h"
#import "AALEvent.h"
#import "AALAddItemViewController.h"

@interface AALDetailViewController : UITableViewController

@property AALEvent *eventItem;

@property (nonatomic) NSMutableArray *myPackingList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (nonatomic) NSInteger indexPathSelected;

@end
