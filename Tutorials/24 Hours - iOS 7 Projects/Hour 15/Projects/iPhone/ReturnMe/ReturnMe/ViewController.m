//
//  ViewController.m
//  ReturnMe
//
//  Created by John Ray on 9/4/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"
#define kName @"name"
#define kEmail @"email"
#define kPhone @"phone"
#define kPicture @"picture"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phone;

-(void)setValuesFromPreferences;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setValuesFromPreferences];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setValuesFromPreferences {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *initialDefaults=@{kPicture:@"Dog",
                                    kName:@"Your Name",
                                    kEmail:@"you@yours.com",
                                    kPhone:@"(555)555-1212"};
    
    [userDefaults registerDefaults:initialDefaults];
    // [userDefaults synchronize];
    
    NSString *picturePreference = [userDefaults stringForKey:kPicture];
    if ([picturePreference isEqualToString:@"Dog"]) {
        self.picture.image = [UIImage imageNamed:@"dog1.png"];
    } else if ([picturePreference isEqualToString:@"Crazy Dog"]) {
        self.picture.image = [UIImage imageNamed:@"dog2.png"];
    } else {
        self.picture.image = [UIImage imageNamed:@"coral.png"];
    }
    
    self.name.text = [userDefaults stringForKey:kName];
    self.email.text = [userDefaults stringForKey:kEmail];
    self.phone.text = [userDefaults stringForKey:kPhone];
}

@end
