//
//  ViewController.m
//  Swapper
//
//  Created by John Ray on 10/25/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"
#define kDeg2Rad (3.1415926/180.0)

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *portraitView;
@property (strong, nonatomic) IBOutlet UIView *landscapeView;
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

- (void)didRotateFromInterfaceOrientation:
(UIInterfaceOrientation)fromInterfaceOrientation {
    
    CGRect currentBounds=self.view.bounds;
    
	if (self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		self.view=self.landscapeView;
        self.view.transform=CGAffineTransformMakeRotation(kDeg2Rad*(90));
	} else if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
		self.view=self.landscapeView;
        self.view.transform=CGAffineTransformMakeRotation(kDeg2Rad*(-90));
	} else {
		self.view=self.portraitView;
		self.view.transform=CGAffineTransformMakeRotation(0);
	}
    self.view.bounds=currentBounds;
}


- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
