//
//  SCTViewController.m
//  MasonryLayoutDemo
//
//  Created by Mugunth on 15/10/13.
//  Copyright (c) 2013 Steinlogic Consulting and Training Pte Ltd. All rights reserved.
//

#import "SCTViewController.h"

@interface SCTViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) NSMutableArray *images;

@end

@implementation SCTViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  
  return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                         forIndexPath:indexPath];
  cell.backgroundColor = [UIColor redColor];
  return cell;
}

// this will be called if our layout is UICollectionViewFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  CGFloat randomHeight = 100 + (arc4random() % 140);
  return CGSizeMake(100, randomHeight); // 100 to 240 pixels tall
}

// this will be called if our layout is MKMasonryViewLayout
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(MKMasonryViewLayout*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath {
  
  // we will use a random height from 100 - 400
  
  CGFloat randomHeight = 100 + (arc4random() % 140);
  return randomHeight;
}

//- (void) downloadImages
//{
//    
//    for (NSInteger i = 0; i < 100; i++) {
//        [self.images addObject:[UIImage imageNamed:@"placeholder"]];
//    }
//    
//    NSOperationQueue *APIDownloader = [[NSOperationQueue alloc] init];
//    APIDownloader.maxConcurrentOperationCount = 10;
//    
//    NSOperationQueue *pugDownloader = [[NSOperationQueue alloc] init];
//    pugDownloader.maxConcurrentOperationCount = 10;
//    
//    NSDate *before = [NSDate date];
//    NSLog(@"Start Running Connections");
//    
//    NSURL *randomPugURL = [NSURL URLWithString:@"http://pugme.herokuapp.com/random"];
//    
//    NSURLRequest *pugRequest = [[NSURLRequest alloc] initWithURL:randomPugURL];
//    
//    for (NSInteger i=0; i<100; i++) {
//        
//        AFHTTPRequestOperation *pugAPIOperation = [[AFHTTPRequestOperation alloc] initWithRequest:pugRequest];
//        
//        [pugAPIOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//            
//            NSDictionary *responseDictionary = responseObject;
//            
//            NSString *pugURLString = responseDictionary[@"pug"];
//            NSURL *pugURL = [NSURL URLWithString:pugURLString];
//            
//            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:pugURL];
//            AFHTTPRequestOperation *imageDownload = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//            
//            imageDownload.responseSerializer = [AFImageResponseSerializer serializer];
//            
//            [imageDownload setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//                
//                UIImage *pugImage = responseObject;
//                [self.images replaceObjectAtIndex:i withObject:pugImage];
//                //[self.pugs addObject:pugImage];
//                
//                NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
//                
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                    //[self.collectionView reloadRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//                    [self.collectionView reloadItemsAtIndexPaths:@[insertIndexPath]];
//                    //usleep(100000);
//                }];
//                
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                NSLog(@"ERROR: %@",error);
//            }];
//            
//            [pugDownloader addOperation:imageDownload];
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"ERROR: %@",error.localizedDescription);
//        }];
//        
//        pugAPIOperation.responseSerializer = [AFJSONResponseSerializer serializer];
//        
//        
//        [APIDownloader addOperation:pugAPIOperation];
//    }
//    
//    NSTimeInterval interval = [before timeIntervalSinceDate:[NSDate date]];
//    NSLog(@"%f",interval);
//}

@end
