//
//  AALMath.m
//  mathTest
//
//  Created by Albert Lardizabal on 8/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALMath.h"

@implementation AALMath

+ (BOOL) checkIfPowerOfTwo:(CGFloat)numberToTest
{

    CGFloat answer = 0;
    NSUInteger numPower = 0;
    
    while (answer < numberToTest) {
        
        answer = pow(2, numPower);
        
        if (numberToTest == answer) {
            return YES;
        } else {
            numPower++;
        }
        
    }
    
    return NO;
    
}

@end
