//
//  AALEventsDataStore.h
//  PackingList
//
//  Created by Albert Lardizabal on 6/23/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AALEventsDataStore : NSObject

@property (nonatomic) NSMutableArray *events;

+ (instancetype)sharedLocationsDataStore;

@end
