//
//  AALAddEventViewController.m
//  PackingList
//
//  Created by Albert Lardizabal on 6/22/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALAddEventViewController.h"

@interface AALAddEventViewController ()

@end

@implementation AALAddEventViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if (sender != self.saveButton) return;
    if (self.addEventTextField.text.length > 0) {
        self.eventItem = [[AALEvent alloc] init];
        self.eventItem.eventName = self.addEventTextField.text;
    }
    
}


@end
