//
//  ViewController.m
//  BackgroundColor
//
//  Created by John Ray on 9/4/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

#define kOnOffToggle @"onOff"
#define kHueSetting @"hue"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UISlider *hueSlider;

- (IBAction)setBackgroundHueValue:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.hueSlider.value = [userDefaults floatForKey:kHueSetting];
    self.toggleSwitch.on = [userDefaults boolForKey:kOnOffToggle];
    if ([userDefaults boolForKey: kOnOffToggle]) {
        self.view.backgroundColor =
        [UIColor colorWithHue:[userDefaults floatForKey:kHueSetting]
                   saturation:0.75
                   brightness:0.75
                        alpha:1.0];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setBackgroundHueValue:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:self.toggleSwitch.on forKey:kOnOffToggle];
    [userDefaults setFloat:self.hueSlider.value
                    forKey:kHueSetting];
    [userDefaults synchronize];
    
    if (self.toggleSwitch.on) {
        self.view.backgroundColor = [UIColor colorWithHue:self.hueSlider.value
                                               saturation:0.75
                                               brightness:0.75
                                                    alpha:1.0];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

@end
