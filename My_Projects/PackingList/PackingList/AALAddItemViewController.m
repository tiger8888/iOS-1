//
//  AALAddItemViewController.m
//  PackingList
//
//  Created by Albert Lardizabal on 6/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALAddItemViewController.h"

@interface AALAddItemViewController ()

@end

@implementation AALAddItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        AALAddItemViewController *test = [[AALAddItemViewController alloc]init];
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
    
//    if (self.eventItem.packingList==nil) {
//        self.eventItem.packingList = [[NSMutableArray alloc]init];
//    }
    
    if (sender != self.saveButton) return;
    
    self.eventItem = [[AALEvent alloc]init];
    
    if (self.addItemTextField.text.length > 0) {
       [self.eventItem.packingList addObject:self.addItemTextField.text];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
