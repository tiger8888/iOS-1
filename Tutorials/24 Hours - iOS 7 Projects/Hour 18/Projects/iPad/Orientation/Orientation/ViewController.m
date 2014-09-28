//
//  ViewController.m
//  Orientation
//
//  Created by John Ray on 8/18/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *orientationLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[UIDevice currentDevice]beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:@"UIDeviceOrientationDidChangeNotification"
     object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)orientationChanged:(NSNotification *)notification {
    
    UIDeviceOrientation orientation;
    orientation = [[UIDevice currentDevice] orientation];
    
    switch (orientation) {
        case UIDeviceOrientationFaceUp:
            self.orientationLabel.text=@"Face Up";
            break;
        case UIDeviceOrientationFaceDown:
            self.orientationLabel.text=@"Face Down";
            break;
        case UIDeviceOrientationPortrait:
            self.orientationLabel.text=@"Standing Up";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            self.orientationLabel.text=@"Upside Down";
            break;
        case UIDeviceOrientationLandscapeLeft:
            self.orientationLabel.text=@"Left Side";
            break;
        case UIDeviceOrientationLandscapeRight:
            self.orientationLabel.text=@"Right Side";
            break;
        default:
            self.orientationLabel.text=@"Unknown";
            break;
    }
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
