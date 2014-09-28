//
//  AALViewController.m
//  DragDropExample
//
//  Created by Albert Lardizabal on 7/31/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"
#import
#import "OBDragDrop.h"

@interface AALViewController ()

@end

@implementation AALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    tempView.backgroundColor = [UIColor greenColor];
    
    UILongPressGestureRecognizer *dragDropRecognizer = [dragDropManager createLongPressDragDropGestureRecognizerWithSource:self];
    
    [tempView addGestureRecognizer:dragDropRecognizer];
    [self.view addSubview:tempView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
