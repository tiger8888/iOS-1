//
//  AALDeck.m
//  AALWar
//
//  Created by Albert Lardizabal on 6/15/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALDeck.h"

@implementation AALDeck

- (instancetype)init
{
    
    self = [super init];
    
    if (self) {
        
        _theDeck = [[NSMutableArray alloc]init];
        [self createDeck];
        
    }
    return self;
}

- (void) createDeck {
    
    // Initialize a standard deck of cards. Jack = 11, Queen = 12, King = 13, Ace = 14.
    
    NSArray *validSuitsArray = @[@"♦️", @"♣️", @"♠️", @"♥️"];
    NSArray *validRanksArray = @[@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14];
    
    for (NSInteger i = 0; i < [validRanksArray count]; i++) {
        for (NSInteger j = 0; j < [validSuitsArray count]; j++) {
            
            AALCard *playingCard = [[AALCard alloc]initWithSuit:validSuitsArray[j] rank:validRanksArray[i]];
            
            [self.theDeck addObject:playingCard];
        }
    }
    
    // Shuffle the deck
    // Loop 100 times, generate two random index numbers, and switch the objects.
    
    for (NSInteger counter = 1; counter < 100; counter++) {
        
        NSUInteger origin = arc4random_uniform(51);                                 // n is one less than the number of cards in the deck
        NSUInteger destination = arc4random_uniform(51);
        
        AALCard *originCard = self.theDeck[origin];
        AALCard *destinationCard = self.theDeck[destination];
        
        [self.theDeck replaceObjectAtIndex:origin withObject:destinationCard];
        [self.theDeck replaceObjectAtIndex:destination withObject:originCard];
    }
}

@end
