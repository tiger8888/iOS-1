//
//  AALPerson.m
//  AALPlayingWithObjects
//
//  Created by Albert Lardizabal on 6/9/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALPerson.h"

@implementation AALPerson


- (NSString *) description{
    
    NSString *result = [NSString stringWithFormat:@"Name: %@ Height %d", self.name, self.height];
    
    return result;
    
}

- (void) talk {
    
    NSLog(@"Hello my name is %@", [self name]);
    
}

@end
