//
//  ViewController.m
//  ColorTilt
//
//  Created by John Ray on 8/18/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

#define kRad2Deg 57.2957795

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *toggleMotion;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UISwitch *toggleAccelerometer;
@property (weak, nonatomic) IBOutlet UISwitch *toggleGyroscope;
@property (weak, nonatomic) IBOutlet UILabel *rollOutput;
@property (weak, nonatomic) IBOutlet UILabel *pitchOutput;
@property (weak, nonatomic) IBOutlet UILabel *yawOutput;
@property (strong,nonatomic) CMMotionManager *motionManager;

- (IBAction)controlHardware:(id)sender;

- (void)doAcceleration:(CMAcceleration)acceleration;
- (void)doRotation:(CMRotationRate)rotation;
- (void)doAttitude:(CMAttitude *)attitude;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.motionManager = [CMMotionManager new];
    self.motionManager.deviceMotionUpdateInterval = .01;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (IBAction)controlHardware:(id)sender {
    if ([self.toggleMotion isOn]) {
        [self.motionManager
         startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
         withHandler:^(CMDeviceMotion *motion, NSError *error) {
             [self doAttitude:motion.attitude];
             if ([self.toggleAccelerometer isOn]) {
                 [self doAcceleration:motion.userAcceleration];
             }
             if ([self.toggleGyroscope isOn]) {
                 [self doRotation:motion.rotationRate];
             }
         }];
    } else {
        self.toggleGyroscope.on=NO;
        self.toggleAccelerometer.on=NO;
        [self.motionManager stopDeviceMotionUpdates];
    }
}

- (void)doAcceleration:(CMAcceleration)acceleration {
    if (acceleration.x > 1.3) {
        self.colorView.backgroundColor = [UIColor greenColor];
    } else if (acceleration.x < -1.3) {
        self.colorView.backgroundColor = [UIColor orangeColor];
    } else if (acceleration.y > 1.3) {
        self.colorView.backgroundColor = [UIColor redColor];
    } else if (acceleration.y < -1.3) {
        self.colorView.backgroundColor = [UIColor blueColor];
    } else if (acceleration.z > 1.3) {
        self.colorView.backgroundColor = [UIColor yellowColor];
    } else if (acceleration.z < -1.3) {
        self.colorView.backgroundColor = [UIColor purpleColor];
    }
}

- (void)doRotation:(CMRotationRate)rotation {
    double value = (fabs(rotation.x)+fabs(rotation.y)+fabs(rotation.z))/12.5;
    if (value > 1.0) { value = 1.0;}
    self.colorView.alpha = value;
}

- (void)doAttitude:(CMAttitude *)attitude {
    self.rollOutput.text=[NSString stringWithFormat:@"%.0f",attitude.roll*kRad2Deg];
    self.pitchOutput.text=[NSString stringWithFormat:@"%.0f",attitude.pitch*kRad2Deg];
    self.yawOutput.text=[NSString stringWithFormat:@"%.0f",attitude.yaw*kRad2Deg];
    if (![self.toggleGyroscope isOn]) {
        self.colorView.alpha=fabs(attitude.pitch);
    }
}

@end
