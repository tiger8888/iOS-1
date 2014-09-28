//
//  ViewController.m
//  SlowCount
//
//  Created by John Ray on 10/9/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theCount;
@property (nonatomic) int count;
@property (nonatomic) UIBackgroundTaskIdentifier counterTask;
@property (nonatomic,weak) NSTimer *theTimer;
- (void)countUp;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.counterTask = [[UIApplication sharedApplication]
                        beginBackgroundTaskWithExpirationHandler:^{
                            // If you’re worried about exceeding 10 minutes, handle it here
                        }];
    self.count=0;
    self.theTimer=[NSTimer scheduledTimerWithTimeInterval:0.1
                                                   target:self
                                                 selector:@selector(countUp)
                                                 userInfo:nil
                                                  repeats:YES];
}

- (void)countUp {
    if (self.count==1000) {
        [self.theTimer invalidate];
        self.theTimer=nil;
        [[UIApplication sharedApplication] endBackgroundTask:self.counterTask];
    } else {
        self.count++;
        NSString *currentCount;
        currentCount=[NSString stringWithFormat:@"%d",self.count];
        self.theCount.text=currentCount;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
