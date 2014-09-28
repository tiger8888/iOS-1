//
//  ViewController.m
//  PopoverEditor
//
//  Created by John Ray on 8/22/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIStoryboardPopoverSegue *popoverSegue;
    popoverSegue=(UIStoryboardPopoverSegue *)segue;
    
    UIPopoverController *popoverController;
    popoverController=popoverSegue.popoverController;
    popoverController.delegate=self;
    
    EditorViewController *editorVC;
    editorVC=(EditorViewController *)popoverController.contentViewController;
    editorVC.emailField.text=self.emailLabel.text;
}


- (void)popoverControllerDidDismissPopover:
(UIPopoverController *)popoverController {
    NSString *newEmail=((EditorViewController *)
                        popoverController.contentViewController).emailField.text;
    self.emailLabel.text=newEmail;
}

@end
