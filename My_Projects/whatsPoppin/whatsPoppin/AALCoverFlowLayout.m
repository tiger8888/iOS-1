//
//  AALCoverFlowLayout.m
//  whatsPoppin
//
//  Created by Albert Lardizabal on 7/28/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALCoverFlowLayout.h"

@implementation AALCoverFlowLayout

#define ZOOM_FACTOR 0.35

-(void) prepareLayout {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGSize size = self.collectionView.frame.size;
    self.itemSize = CGSizeMake(size.width/4.0f, size.height*0.7);
    self.sectionInset = UIEdgeInsetsMake(size.height * 0.15, size.height * 0.1, size.height * 0.15, size.height * 0.1);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    float collectionViewHalfFrame = self.collectionView.frame.size.width/2.0f;
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normalizedDistance = distance / collectionViewHalfFrame;
            if (ABS(distance) < collectionViewHalfFrame) {
                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
                CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
                rotationAndPerspectiveTransform.m34 = 1.0 / -500;
                rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, (normalizedDistance) * M_PI_4, 0.0f, 1.0f, 0.0f);
                CATransform3D zoomTransform = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.transform3D = CATransform3DConcat(zoomTransform, rotationAndPerspectiveTransform);
                attributes.zIndex = ABS(normalizedDistance) * 10.0f;
                CGFloat alpha = (1 - ABS(normalizedDistance)) + 0.1;
                if(alpha > 1.0f) alpha = 1.0f;
                attributes.alpha = alpha;
            } else {
                
                attributes.alpha = 0.0f;
            }
        }
    }
    return array;
}
@end
