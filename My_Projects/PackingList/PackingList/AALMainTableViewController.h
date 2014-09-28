//
//  AALMainTableViewController.h
//  PackingList
//  Event list
//
//  Created by Albert Lardizabal on 6/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AALAddEventViewController.h"
#import "AALDetailViewController.h"
#import "AALEventsDataStore.h"
#import "AALEvent.h"

@interface AALMainTableViewController : UITableViewController

@property (nonatomic) AALEventsDataStore *store;
@property (nonatomic) NSMutableArray *eventList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (nonatomic) NSInteger indexPathSelected;

@end
