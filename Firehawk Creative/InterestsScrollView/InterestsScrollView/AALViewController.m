//
//  AALViewController.m
//  InterestsScrollView
//
//  Created by Albert Lardizabal on 7/29/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"
#import "AALCategory.h"
#import "AALInterest.h"

@interface AALViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *test;
@property (weak, nonatomic) IBOutlet UIImageView *test2;
@property (weak, nonatomic) IBOutlet UIImageView *test3;

@property (weak, nonatomic) IBOutlet UIImageView *sub1;
@property (weak, nonatomic) IBOutlet UIImageView *sub2;
@property (weak, nonatomic) IBOutlet UIImageView *sub3;

@end

@implementation AALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.test.layer.cornerRadius = self.test.frame.size.height/2;
    self.test.clipsToBounds = YES;
    
    self.test2.layer.cornerRadius = self.test2.frame.size.height/2;
    self.test2.clipsToBounds = YES;
    
    self.test3.layer.cornerRadius = self.test3.frame.size.height/2;
    self.test3.clipsToBounds = YES;
    
    self.sub1.layer.cornerRadius = self.sub1.frame.size.height/2;
    self.sub1.clipsToBounds = YES;
    
    self.sub2.layer.cornerRadius = self.sub2.frame.size.height/2;
    self.sub2.clipsToBounds = YES;
    
    self.sub3.layer.cornerRadius = self.sub3.frame.size.height/2;
    self.sub3.clipsToBounds = YES;
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
