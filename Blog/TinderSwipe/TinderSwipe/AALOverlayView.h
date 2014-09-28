//
//  AALOverlayView.h
//  TinderSwipe
//
//  Created by Albert Lardizabal on 7/22/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger , AALOverlayViewMode) {
    AALOverlayViewModeLeft,
    AALOverlayViewModeRight
};

@interface AALOverlayView : UIView

@property (nonatomic) AALOverlayViewMode mode;

@end
