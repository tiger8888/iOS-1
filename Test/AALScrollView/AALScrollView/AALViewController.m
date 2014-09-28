//
//  AALViewController.m
//  AALScrollView
//
//  Created by Albert Lardizabal on 8/11/14.
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
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1500, 1000)];
    
    imageView.image = [UIImage imageNamed:@"times_square"];
    
    
    [scroller addSubview:contentView];
    [contentView addSubview:imageView];
    
    scroller.contentSize = CGSizeMake(1500, 1000);
    
    [self.view addSubview:scroller];
    
    scroller.delegate = self;
    
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f", scrollView.contentOffset.x);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
