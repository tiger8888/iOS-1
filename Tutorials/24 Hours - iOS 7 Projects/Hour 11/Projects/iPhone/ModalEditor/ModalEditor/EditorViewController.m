//
//  EditorViewController.m
//  ModalEditor
//
//  Created by John Ray on 8/22/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)updateEditor:(id)sender;
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
    self.emailField.text=
    ((ViewController *)self.presentingViewController).emailLabel.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateEditor:(id)sender {
    ((ViewController *)self.presentingViewController).emailLabel.text=
    self.emailField.text;
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)hideKeyboard:(id)sender {
    [self.emailField resignFirstResponder];
}

@end
