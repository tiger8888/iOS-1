//
//  main.m
//  AALOrder
//
//  Created by Albert Lardizabal on 6/4/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        BOOL sorted = NO;
        
        while (!sorted) {
            sorted = YES;
        NSArray *unsortedItems = @[@4, @2, @7];
        NSMutableArray *sortedItems = [[NSMutableArray alloc] initWithArray:unsortedItems];
        
        for (NSInteger x = 0; x < [sortedItems count] - 1; x++) {
            
            NSString *firstValue = unsortedItems[x];
            NSString *secondValue = unsortedItems[x+1];
            
            NSLog(@"%@", sortedItems[x]);
            
            if (sortedItems[x] > sortedItems[x+1]) {
                sortedItems[x] =  secondValue;
                sortedItems[x+1] = firstValue;
                sorted = NO;
            }
            

        }
            // end for
        
//           for(NSString *item in sortedItems) {
//                NSLog(@"%@", item);
//
//            
//        } // end while
        
    }
    
    return 0;
}
}