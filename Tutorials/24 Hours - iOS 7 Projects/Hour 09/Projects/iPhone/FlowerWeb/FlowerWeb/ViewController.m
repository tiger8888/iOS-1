//
//  ViewController.m
//  FlowerWeb
//
//  Created by John Ray on 8/3/13.
//  Copyright (c) 2013 John Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (weak, nonatomic) IBOutlet UIWebView *flowerView;
@property (weak, nonatomic) IBOutlet UIWebView *flowerDetailView;
@property (strong, nonatomic) AMBlurView *blurView;

- (IBAction)getFlower:(id)sender;
- (IBAction)toggleFlowerDetail:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.flowerDetailView.hidden=YES;
	[self getFlower:nil];
    
    self.blurView = [AMBlurView new];
    [self.blurView setFrame:self.flowerDetailView.frame];
    [self.view insertSubview:self.blurView belowSubview:self.flowerDetailView];
    self.blurView.hidden=YES;
     
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    //[self.flowerDetailView addSubview:self.blurView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getFlower:(id)sender {
    NSURL *imageURL;
	NSURL *detailURL;
	NSString *imageURLString;
	NSString *detailURLString;
	NSString *color;
	int sessionID;
	
	color=[self.colorChoice titleForSegmentAtIndex:
		   self.colorChoice.selectedSegmentIndex];
	sessionID=random()%50000;
	
	imageURLString=[NSString stringWithFormat:
					@"http://www.floraphotographs.com/showrandomios.php?color=%@&session=%d"
					,color,sessionID];
	detailURLString=[NSString stringWithFormat:
					 @"http://www.floraphotographs.com/detailios.php?session=%d"
					 ,sessionID];
    
	imageURL=[[NSURL alloc] initWithString:imageURLString];
	detailURL=[[NSURL alloc] initWithString:detailURLString];
    
	[self.flowerView loadRequest:[NSURLRequest requestWithURL:imageURL]];
	[self.flowerDetailView loadRequest:[NSURLRequest requestWithURL:detailURL]];
    

	//self.flowerDetailView.backgroundColor=[UIColor clearColor];
}

- (IBAction)toggleFlowerDetail:(id)sender {
    self.flowerDetailView.hidden=![sender isOn];
    self.blurView.hidden=![sender isOn];
}

@end
