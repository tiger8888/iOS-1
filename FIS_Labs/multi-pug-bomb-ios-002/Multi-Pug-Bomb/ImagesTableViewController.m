//
//  ImagesTableViewController.m
//  NSOperationQueue
//
//  Created by Al Tyus on 3/26/14.
//  Copyright (c) 2014 al-tyus.com. All rights reserved.
//

#import "ImagesTableViewController.h"
#import "FISPugCell.h"
#import <AFNetworking/AFNetworking.h> 
#import "pugAPI.h"

@interface ImagesTableViewController ()

@end

@implementation ImagesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pugs = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 0; i < 100; i++) {
        [self.pugs addObject:[UIImage imageNamed:@"placeholder"]];
    }
    
    NSOperationQueue *APIDownloader = [[NSOperationQueue alloc] init];
    APIDownloader.maxConcurrentOperationCount = 10;
    
    NSOperationQueue *pugDownloader = [[NSOperationQueue alloc] init];
    pugDownloader.maxConcurrentOperationCount = 10;
    
    NSDate *before = [NSDate date];
    NSLog(@"Start Running Connections");

    NSURL *randomPugURL = [NSURL URLWithString:@"http://makersfinders.firehawkcreative.com/api/v1/sectors"];
    
    NSURLRequest *pugRequest = [[NSURLRequest alloc] initWithURL:randomPugURL];
    
    for (NSInteger i=0; i<100; i++) {

        AFHTTPRequestOperation *pugAPIOperation = [[AFHTTPRequestOperation alloc] initWithRequest:pugRequest];
        
        
        [pugAPIOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

            NSDictionary *responseDictionary = responseObject;
            
            NSString *pugURLString = responseDictionary[@"images"][@"retina"];
            NSURL *pugURL = [NSURL URLWithString:pugURLString];
            
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:pugURL];
            AFHTTPRequestOperation *imageDownload = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            
            imageDownload.responseSerializer = [AFImageResponseSerializer serializer];
            
            [imageDownload setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                UIImage *pugImage = responseObject;
                [self.pugs replaceObjectAtIndex:i withObject:pugImage];
                //[self.pugs addObject:pugImage];
                
                NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.tableView reloadRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    //usleep(100000);
                }];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"ERROR: %@",error);
            }];
            
            [pugDownloader addOperation:imageDownload];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"ERROR: %@",error.localizedDescription);
        }];
        
        pugAPIOperation.responseSerializer = [AFJSONResponseSerializer serializer];
        
        
        [APIDownloader addOperation:pugAPIOperation];
    }
    
    NSTimeInterval interval = [before timeIntervalSinceDate:[NSDate date]];
    NSLog(@"%f",interval);

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.pugs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSIndexPath *ip = indexPath;
    FISPugCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pugCell" forIndexPath:ip];
    
    //    cell.pugImageView.image = self.pugs[ip.row];
    [self tableView:self.tableView heightForRowAtIndexPath:indexPath];
    UIImage *image = self.pugs[indexPath.row];
    cell.pugImageView.image = image;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
