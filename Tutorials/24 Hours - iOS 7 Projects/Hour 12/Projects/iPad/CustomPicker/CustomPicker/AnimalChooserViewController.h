//
//  AnimalChooserViewController.h
//  CustomPicker
//
//  Created by John Ray on 10/11/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AnimalChooserViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) id delegate;
@end
