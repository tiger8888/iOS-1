//
//  ViewController.h
//  ModalEditor
//
//  Created by John Ray on 8/22/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

- (IBAction)exitToHere:(UIStoryboardSegue *)sender;

@end
