//
//  DateChooserViewController.m
//  DateCalc
//
//  Created by John Ray on 10/11/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "DateChooserViewController.h"

@interface DateChooserViewController ()
- (IBAction)dismissDateChooser:(id)sender;
- (IBAction)setDateTime:(id)sender;
@end

@implementation DateChooserViewController

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

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [(ViewController *)self.delegate calculateDateDifference:[NSDate date]];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    ((ViewController *)self.delegate).dateChooserVisible=NO;
}

- (IBAction)dismissDateChooser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setDateTime:(id)sender {
    [(ViewController *)self.delegate calculateDateDifference:((UIDatePicker *)sender).date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
