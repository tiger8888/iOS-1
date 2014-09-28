//
//  ViewController.m
//  Disconnected
//
//  Created by John Ray on 10/6/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (weak, nonatomic) IBOutlet UIWebView *flowerView;
@property (weak, nonatomic) IBOutlet UILabel *chosenColor;

-(IBAction)getFlower:(id)sender;
@end

@implementation ViewController

-(IBAction)getFlower:(id)sender {
	NSString *outputHTML;
	NSString *color;
	NSString *colorVal;
	int colorNum;
	colorNum=self.colorChoice.selectedSegmentIndex;
	switch (colorNum) {
		case 0:
			color=@"Red";
			colorVal=@"red";
			break;
		case 1:
			color=@"Blue";
			colorVal=@"blue";
			break;
		case 2:
			color=@"Yellow";
			colorVal=@"yellow";
			break;
		case 3:
			color=@"Green";
			colorVal=@"green";
			break;
	}
	self.chosenColor.text=[[NSString alloc] initWithFormat:@"%@",color];
	outputHTML=[[NSString alloc] initWithFormat:@"<body style='margin: 0px; padding: 0px'><img height='1200' src='http://www.floraphotographs.com/showrandom.php?color=%@'></body>",colorVal];
	[self.flowerView loadHTMLString:outputHTML baseURL:nil];
}


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

@end
