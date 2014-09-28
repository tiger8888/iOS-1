//
//  main.m
//  Arc4Random
//
//  Created by Albert Lardizabal on 6/25/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        float randNum = arc4random();
        
        // insert code here...
        NSLog(@"%f", randNum);
        
    }
    return 0;
}

