//
//  ViewController.m
//  FieldButtonFun
//
//  Created by John Ray on 7/25/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *thePlace;
@property (weak, nonatomic) IBOutlet UITextField *theVerb;
@property (weak, nonatomic) IBOutlet UITextField *theNumber;
@property (weak, nonatomic) IBOutlet UITextView *theTemplate;
@property (weak, nonatomic) IBOutlet UITextView *theStory;

- (IBAction)createStory:(id)sender;
- (IBAction)hideKeyboard:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    UIImage *normalImage = [[UIImage imageNamed:@"whiteButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 12)
                            resizingMode:UIImageResizingModeStretch];
	UIImage *pressedImage = [[UIImage imageNamed:@"blueButton.png"]
                             resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 12)
                             resizingMode:UIImageResizingModeStretch];
    [self.theButton setBackgroundImage:normalImage
                              forState:UIControlStateNormal];
	[self.theButton setBackgroundImage:pressedImage
                              forState:UIControlStateHighlighted];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*  1:*/- (IBAction)createStory:(id)sender {
/*  2:*/    self.theStory.text=[self.theTemplate.text
/*  3:*/                        stringByReplacingOccurrencesOfString:@"<place>"
/*  4:*/                        withString:self.thePlace.text];
/*  5:*/    self.theStory.text=[self.theStory.text
/*  6:*/                        stringByReplacingOccurrencesOfString:@"<verb>"
/*  7:*/                        withString:self.theVerb.text];
/*  8:*/    self.theStory.text=[self.theStory.text
/*  9:*/                        stringByReplacingOccurrencesOfString:@"<number>"
/* 10:*/                        withString:self.theNumber.text];
/* 11:*/}


- (IBAction)hideKeyboard:(id)sender {
    [self.thePlace resignFirstResponder];
    [self.theVerb resignFirstResponder];
    [self.theNumber resignFirstResponder];
    [self.theTemplate resignFirstResponder];
}


@end
