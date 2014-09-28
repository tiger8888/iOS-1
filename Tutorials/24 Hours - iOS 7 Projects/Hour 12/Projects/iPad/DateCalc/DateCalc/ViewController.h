//
//  ViewController.h
//  DateCalc
//
//  Created by John Ray on 10/11/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateChooserViewController.h"

@interface ViewController : UIViewController

- (void)calculateDateDifference:(NSDate *)chosenDate;
@property (nonatomic) Boolean dateChooserVisible;
@end
