//
//  AALView.m
//  TinderSwipe
//
//  Created by Albert Lardizabal on 7/21/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALView.h"
#import "AALSwipeView.h"

@interface AALView ()

@property (nonatomic) AALSwipeView *swipeView;

@end

@implementation AALView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self loadSwipeView];
        
        // Initialization code
    }
    return self;
}

- (void) loadSwipeView {
    
    self.swipeView = [[AALSwipeView alloc] initWithFrame:CGRectMake(60, 60, 200, 260)];
    [self addSubview:self.swipeView];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
