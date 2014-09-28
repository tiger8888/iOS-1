//
//  AALMasonryLayout.h
//  whatsPoppin
//
//  Created by Albert Lardizabal on 7/28/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class AALMasonryLayout;

@protocol AALMasonryViewLayoutDelegate <NSObject>

@required
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(AALMasonryLayout *) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath;
@end

@interface AALMasonryLayout : UICollectionViewLayout
@property (nonatomic, assign) NSUInteger numberOfColumns;
@property (nonatomic, assign) CGFloat interItemSpacing;
@property (weak, nonatomic) IBOutlet id<AALMasonryViewLayoutDelegate> delegate;

@end
