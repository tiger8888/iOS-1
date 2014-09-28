//
//  AALAddEventViewController.h
//  PackingList
//
//  Created by Albert Lardizabal on 6/22/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AALEvent.h"

@interface AALAddEventViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *addEventTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property AALEvent *eventItem;

@end
