//
//  EditorViewController.m
//  PopoverEditor
//
//  Created by John Ray on 8/22/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()
    - (IBAction)hideKeyboard:(id)sender;
@end

@implementation EditorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideKeyboard:(id)sender {
    [self.emailField resignFirstResponder];
}

@end
