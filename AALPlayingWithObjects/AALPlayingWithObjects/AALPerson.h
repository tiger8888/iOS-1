//
//  AALPerson.h
//  AALPlayingWithObjects
//
//  Created by Albert Lardizabal on 6/9/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AALPerson : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger height;
@property (nonatomic, strong) NSMutableArray *friends;

- (NSString *)description;

- (void) talk;

@end
