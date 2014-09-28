//
//  ViewController.m
//  HelloNoun
//
//  Created by John Ray on 7/24/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userOutput;
@property (weak, nonatomic) IBOutlet UITextField *userInput;
- (IBAction)setOutput:(id)sender;
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

- (IBAction)setOutput:(id)sender {
    self.userOutput.text=self.userInput.text;
}

@end
