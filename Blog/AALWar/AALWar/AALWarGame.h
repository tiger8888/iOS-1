//
//  AALWarGame.h
//  AALWar
//
//  Created by Albert Lardizabal on 6/15/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALDeck.h"

@interface AALWarGame : NSObject

@property (nonatomic) BOOL playerOneWinFlag;
@property (nonatomic) BOOL playerTwoWinFlag;

@property (nonatomic) NSMutableArray *firstPlayerDeck;
@property (nonatomic) NSMutableArray *secondPlayerDeck;

@property (nonatomic) NSMutableArray *battleCardArray;
@property (nonatomic) AALDeck *startDeck;

@property (nonatomic) AALCard *firstPlayerBattleCard;
@property (nonatomic) AALCard *secondPlayerBattleCard;

- (instancetype) init;

- (void) drawBottomCard;    // Draw the bottom card for each player.
- (void) drawThreeCards;    // WAR!

- (void) battle;            // Players draw the bottom card.  The higher card wins and the winner takes both cards.

- (void) war;               // If drawn cards are the same, three cards are drawn from the bottom of their decks.
                            // A fourth card is drawn, and the player with the higher card wins and takes all cards.

- (void) checkWinner;       // Check to see if either player has run out of cards.

@end
