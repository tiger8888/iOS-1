//
//  AALCard.h
//  AALWar
//
//  Created by Albert Lardizabal on 6/15/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AALCard : NSObject

@property (nonatomic, copy) NSString *suit;
@property (nonatomic) NSNumber *rank;

- (instancetype) init;

- (instancetype)initWithSuit:(NSString *)suit
                        rank:(NSNumber *)rank;

@end
