//
//  AALOverlayView.m
//  TinderSwipe
//
//  Created by Albert Lardizabal on 7/22/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALOverlayView.h"

@interface AALOverlayView ()

@property (nonatomic) UIImageView *imageView;

@end

@implementation AALOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"914-skull-and-crossbones"]];
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)setMode:(AALOverlayViewMode)mode
{
    if (_mode == mode) return;
    
    _mode = mode;
    if (mode == AALOverlayViewModeLeft) {
        self.imageView.image = [UIImage imageNamed:@"914-skull-and-crossbones"];
    } else {
        self.imageView.image = [UIImage imageNamed:@"1040-checkmark"];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(50, 50, 100, 100);
}

@end
