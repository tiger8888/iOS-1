//
//  AALCard.m
//  AALWar
//
//  Created by Albert Lardizabal on 6/15/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALCard.h"

@implementation AALCard

- (instancetype)init {

    return [self initWithSuit:@"" rank:@0];
    
}

- (instancetype) initWithSuit:(NSString *)suit rank:(NSNumber *)rank {
    
    self = [super init];
    if (self) {
        _suit = suit;
        _rank = rank;
    }
    return self;
    
}

@end
