//
//  AALViewController.m
//  gestureRecognizer
//
//  Created by Albert Lardizabal on 7/14/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"

@interface AALViewController ()

@end

@implementation AALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(loadNewStock:)];
    [self.view addGestureRecognizer:tapRecognizer];
    
    tapRecognizer.delegate = self;
    
}

- (void) loadNewStock:(UITapGestureRecognizer *)recognizer {

    NSLog(@"Hi");
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
