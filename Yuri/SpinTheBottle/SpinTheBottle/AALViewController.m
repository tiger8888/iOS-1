//
//  AALViewController.m
//  SpinTheBottle
//
//  Created by Albert Lardizabal on 8/26/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"

@interface AALViewController ()

@property (nonatomic) UILabel *dareLabel;

@end

@implementation AALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIView *titleLabelBgViewBorder = [[UIView alloc]initWithFrame:CGRectMake(self.view.center.x - 85, 40, 170, 40)];
    titleLabelBgViewBorder.backgroundColor = [UIColor blackColor];
    [self.view addSubview:titleLabelBgViewBorder];
    
    UIView *titleLabelBgView = [[UIView alloc]initWithFrame:CGRectMake(self.view.center.x - 80, 45, 160, 30)];
    titleLabelBgView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:titleLabelBgView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x - 75, 50, 150, 20)];
    titleLabel.text = @"Yuri's Best Idea!";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textColor = [UIColor darkGrayColor];
    [self.view addSubview:titleLabel];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(self.view.center.x - 80, self.view.center.y - 80, 160, 160)];
    bgView.layer.cornerRadius = bgView.frame.size.height/2;
    bgView.clipsToBounds = YES;
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    self.dareLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x - 70, self.view.center.y - 70, 140, 140)];
    
    self.dareLabel.backgroundColor = [UIColor blueColor];
    self.dareLabel.layer.cornerRadius = self.dareLabel.frame.size.height/2;
    self.dareLabel.clipsToBounds = YES;
    [self.view addSubview:self.dareLabel];
    
    self.dareLabel.textAlignment = NSTextAlignmentCenter;
    self.dareLabel.textColor = [UIColor whiteColor];
    
    UILabel *instructionLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x - 75, self.view.bounds.size.height - 50, 150, 20)];
    instructionLabel.text = @"Shake to Play!";
    instructionLabel.textAlignment = NSTextAlignmentCenter;
    instructionLabel.font = [UIFont boldSystemFontOfSize:12];
    [self.view addSubview:instructionLabel];
    
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        NSArray *dareArray = @[@"Slap a Dick", @"Titty Twister", @"Face Slap", @"Ball Tap", @"Butt Pinch"];
        int randomNumber = arc4random_uniform(5);
        self.dareLabel.text = dareArray[randomNumber];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
