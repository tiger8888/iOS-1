//
//  AALViewController.m
//  whatsPoppin
//
//  Created by Albert Lardizabal on 7/12/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALCollectionViewController.h"
#import "AALCoverFlowLayout.h"
#import "AALDetailViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "AALMasonryLayout.h"
#import "AALCell.h"

@interface AALCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation AALCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.images = [[NSMutableArray alloc]init];

    [self downloadImages];
    
    self.collectionView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.images count];
}
// 2
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

// Standard Collection View
    
    UIImage *cellImage = [[UIImage alloc]init];
    //cellImage = [UIImage imageNamed:self.images[indexPath.row]];
    
    cellImage = self.images[indexPath.row];
    
    if (cellImage.size.width > cellImage.size.height) {
            AALCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"landscapeCell" forIndexPath:indexPath];
        cell.landscapeImageView.image = cellImage;
        cell.landscapeCellText.text = [NSString stringWithFormat:@"Pug %ld", (long)indexPath.row];
        return cell;
    } else {
            AALCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"portraitCell" forIndexPath:indexPath];
        cell.portraitImageView.image = cellImage;
        cell.portraitCellText.text = [NSString stringWithFormat:@"Pug %ld", (long)indexPath.row];
        return cell;
    }
    
// *****
    
//    static NSString *CellIdentifier = @"portraitCell";
//    
//    AALCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    NSString *photoName = self.images[indexPath.row];
//    //NSString *photoFilePath = [[self photosDirectory] stringByAppendingPathComponent:photoName];
//    //cell.nameLabel.text =[photoName stringByDeletingPathExtension];
//    
//    __block UIImage* thumbImage = [UIImage imageNamed:photoName];
//    cell.portraitImageView.image = thumbImage;
//    AALCoverFlowLayout *layout = (AALCoverFlowLayout *) collectionView.collectionViewLayout;
//    
//    if(!thumbImage) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//            
//            UIImage *image = self.images[indexPath.row];
//            float scale = [UIScreen mainScreen].scale;
//            UIGraphicsBeginImageContextWithOptions(layout.itemSize, YES, scale);
//            [image drawInRect:CGRectMake(0, 0, layout.itemSize.width, layout.itemSize.height)];
//            thumbImage = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//                //[self.images setObject:thumbImage forKey:photoName];
//                cell.portraitImageView.image = thumbImage;
//            });
//        });
//    }
//    
//    return cell;
    
}

//// this will be called if our layout is UICollectionViewFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    CGFloat randomHeight = 100 + (arc4random() % 140);
//    return CGSizeMake(60, randomHeight); // 100 to 240 pixels tall
//}
////
//// this will be called if our layout is MKMasonryViewLayout
//- (CGFloat) collectionView:(UICollectionView*) collectionView
//                    layout:(AALMasonryLayout *) layout
//  heightForItemAtIndexPath:(NSIndexPath*) indexPath {
//    
//    // we will use a random height from 100 - 400
//    
//    CGFloat randomHeight = 100 + (arc4random() % 140);
//    return randomHeight;
//}


// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"MainSegue" sender:indexPath];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *svHeader = @"sectionHeader";
    
    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:svHeader forIndexPath:indexPath];
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1 
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGPointZero;
//}

// 3 - Spacing between top, left, bottom, and right
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = sender;
    
    AALDetailViewController *detailVC = segue.destinationViewController;
    //detailVC.detailPhoto = [UIImage imageNamed:self.images[selectedIndexPath.row]];
    detailVC.detailPhoto = self.images[selectedIndexPath.row];

}

- (IBAction)unwindToCollectionVC:(UIStoryboardSegue *)segue
{
    
}

- (void) downloadImages
{
    
    for (NSInteger i = 0; i < 100; i++) {
        [self.images addObject:[UIImage imageNamed:@"placeholder"]];
    }
    
    NSOperationQueue *APIDownloader = [[NSOperationQueue alloc] init];
    APIDownloader.maxConcurrentOperationCount = 10;
    
    NSOperationQueue *pugDownloader = [[NSOperationQueue alloc] init];
    pugDownloader.maxConcurrentOperationCount = 10;
    
    NSDate *before = [NSDate date];
    NSLog(@"Start Running Connections");
    
    NSURL *randomPugURL = [NSURL URLWithString:@"http://pugme.herokuapp.com/random"];
    
    NSURLRequest *pugRequest = [[NSURLRequest alloc] initWithURL:randomPugURL];
    
    for (NSInteger i=0; i<100; i++) {
        
        AFHTTPRequestOperation *pugAPIOperation = [[AFHTTPRequestOperation alloc] initWithRequest:pugRequest];
        
        [pugAPIOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *responseDictionary = responseObject;
            
            NSString *pugURLString = responseDictionary[@"pug"];
            NSURL *pugURL = [NSURL URLWithString:pugURLString];
            
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:pugURL];
            AFHTTPRequestOperation *imageDownload = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            
            imageDownload.responseSerializer = [AFImageResponseSerializer serializer];
            
            [imageDownload setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                UIImage *pugImage = responseObject;
                [self.images replaceObjectAtIndex:i withObject:pugImage];
                //[self.pugs addObject:pugImage];
                
                NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    //[self.collectionView reloadRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    [self.collectionView reloadItemsAtIndexPaths:@[insertIndexPath]];
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

@end
