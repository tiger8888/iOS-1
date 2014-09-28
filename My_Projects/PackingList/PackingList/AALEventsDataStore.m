//
//  AALEventsDataStore.m
//  PackingList
//
//  Created by Albert Lardizabal on 6/23/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALEventsDataStore.h"

@implementation AALEventsDataStore

+ (instancetype)sharedLocationsDataStore {
    static AALEventsDataStore *_sharedLocationsDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedLocationsDataStore = [[AALEventsDataStore alloc] init];
    });
    
    return _sharedLocationsDataStore;
}

@end
