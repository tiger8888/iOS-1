//
//  AALAddItemViewController.h
//  PackingList
//  Add Item
//
//  Created by Albert Lardizabal on 6/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AALEvent.h"

@interface AALAddItemViewController : UIViewController

@property AALEvent *eventItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *addItemTextField;

@end
