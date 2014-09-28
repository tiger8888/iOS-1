//
//  AALWarGame.m
//  AALWar
//
//  Created by Albert Lardizabal on 6/15/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALWarGame.h"

@implementation AALWarGame

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // Create a deck object with theDeck as the array containing the initialized array of cards.
        _startDeck = [[AALDeck alloc]init];
        
        _firstPlayerDeck = [[NSMutableArray alloc]init];
        _secondPlayerDeck = [[NSMutableArray alloc]init];
        
        // Each round, players draw a card from their deck and place it into this array which acts as the "pot".
        _battleCardArray = [[NSMutableArray alloc]init];
        
        _firstPlayerBattleCard = [[AALCard alloc]init];
        _secondPlayerBattleCard = [[AALCard alloc]init];
        
        // The game continues until either of the flags equal TRUE
        _playerOneWinFlag = NO;
        _playerTwoWinFlag = NO;
        
        
        // The below loops split the deck evenly between both players.
        for (NSInteger i = 0; i < 26; i++) {
            [_firstPlayerDeck addObject:_startDeck.theDeck[i]];
        }
        
        for (NSInteger i = 26; i < 52; i++) {
            [_secondPlayerDeck addObject:_startDeck.theDeck[i]];
        }
        
    }
    return self;
}

// Players draw the bottom card. The higher card wins and the winner takes both cards.
// The battle card array is appended to the winner's deck array.
- (void) battle {
    
    [self drawBottomCard];
    
    NSLog(@"\n\nBattle! \nPlayer One: %@%@\nPlayer Two: %@%@\n\n", self.firstPlayerBattleCard.rank, self.firstPlayerBattleCard.suit, self.secondPlayerBattleCard.rank, self.secondPlayerBattleCard.suit);
    
    if ([self.firstPlayerBattleCard.rank integerValue] > [self.secondPlayerBattleCard.rank integerValue]) {
        
        // Player one wins and gets the three cards in the battle array and the fourth battle card.
        
        [self.firstPlayerDeck addObjectsFromArray:self.battleCardArray];
        
        NSLog(@"\n\nPlayer One Wins the Battle and %d Card(s)!\n\n", [self.battleCardArray count]/2);
        
        // Zero out the battle card array.
        
        [self.battleCardArray removeAllObjects];
        
        
    } else if ([self.secondPlayerBattleCard.rank integerValue] > [self.firstPlayerBattleCard.rank integerValue]) {
        
        [self.secondPlayerDeck addObjectsFromArray:self.battleCardArray];
        
        NSLog(@"\n\nPlayer Two Wins the Battle and %d Card(s)!\n\n", [self.battleCardArray count]/2);
        
        [self.battleCardArray removeAllObjects];
        
    } else {
        
        NSLog(@"\n\nWar!\n\n");
        
        [self war];
        
    }
}

// If drawn cards are the same, three cards are drawn from the bottom of their decks.
// A fourth card is drawn, and the player with the higher card wins and takes all of the cards.
- (void) war {
    
    [self drawThreeCards];
    
    [self battle];
    
}

// Check to see if either player has run out of cards.
// A player loses in the middle of war if they cannot draw three cards and an additional battle card.
- (void) checkWinner {
    
    if ([self.firstPlayerDeck count] == 0) {
        self.playerOneWinFlag = YES;
        [self.firstPlayerDeck addObjectsFromArray:self.battleCardArray];
        NSLog(@"\n\nPlayer Two Wins the Game!");
        exit(0);
        
    } else if ([self.secondPlayerDeck count] == 0) {
        self.playerTwoWinFlag = YES;
        [self.secondPlayerDeck addObjectsFromArray:self.battleCardArray];
        NSLog(@"\n\nPlayer One Wins the Game!");
        exit(0);
    }
    
    NSLog(@"\n\nPlayer 1 Card Count: %d\n\nPlayer 2 Card Count: %d", [self.firstPlayerDeck count], [self.secondPlayerDeck count]);
    
}

// ** Draw the bottom card for each player. **
// 1. Check for a winner
// 2. Prep the battlecard object for comparison with the second player
// 3. Add that card to the battle card array.
// 4. Remove that card from the player's deck
- (void) drawBottomCard {
    
    [self checkWinner];
    
    self.firstPlayerBattleCard = [self.firstPlayerDeck objectAtIndex:0];
    [self.battleCardArray addObject:[self.firstPlayerDeck objectAtIndex:0]];
    [self.firstPlayerDeck removeObjectAtIndex:0];
    
    self.secondPlayerBattleCard = [self.secondPlayerDeck objectAtIndex:0];
    [self.battleCardArray addObject:[self.secondPlayerDeck objectAtIndex:0]];
    [self.secondPlayerDeck removeObjectAtIndex:0];
    
}

// ** Draw three cards for war! **
// 1. Check for a winner
// 2. Add that card to the battle card array.
// 3. Remove that card from the player's deck
- (void) drawThreeCards {
    
    NSLog(@"\n\nDrawing three cards from each player...\n\n");
    
    for (NSInteger i = 1; i < 4; i++) {
        
        [self checkWinner];
        
        [self.battleCardArray addObject:[self.firstPlayerDeck objectAtIndex:0]];
        [self.firstPlayerDeck removeObjectAtIndex:0];
        
        [self.battleCardArray addObject:[self.secondPlayerDeck objectAtIndex:0]];
        [self.secondPlayerDeck removeObjectAtIndex:0];
        
    }
    
}

@end
