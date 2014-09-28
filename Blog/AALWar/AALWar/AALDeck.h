//
//  AALDeck.h
//  AALWar
//
//  Created by Albert Lardizabal on 6/15/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AALCard.h"

@interface AALDeck : NSObject

@property (nonatomic) NSMutableArray *theDeck;

- (instancetype) init;

- (void) createDeck;

@end
