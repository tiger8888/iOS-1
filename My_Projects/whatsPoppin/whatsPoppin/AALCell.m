//
//  Cell.m
//  whatsPoppin
//
//  Created by Albert Lardizabal on 7/23/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALCell.h"

@implementation AALCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) awakeFromNib

{
    self.selectedBackgroundView = [[UIView alloc]initWithFrame:self.frame];
    //self.selectedBackgroundView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
    
    [super awakeFromNib];
    
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
