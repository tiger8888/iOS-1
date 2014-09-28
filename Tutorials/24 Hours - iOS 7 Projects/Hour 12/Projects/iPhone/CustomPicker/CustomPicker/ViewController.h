//
//  ViewController.h
//  CustomPicker
//
//  Created by John Ray on 10/11/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController
@property (nonatomic) Boolean animalChooserVisible;
- (void)displayAnimal:(NSString *)chosenAnimal withSound:(NSString *)chosenSound fromComponent:(NSString *)chosenComponent;
@end
