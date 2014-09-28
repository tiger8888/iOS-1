//
//  AALPlaylist.h
//  Jukebox
//
//  Created by Albert Lardizabal on 6/18/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AALSong.h"

@interface AALPlaylist : NSObject



@property (nonatomic) NSString *name;               // The playlist's name
@property (nonatomic) NSMutableArray *songList;     // Array containing a playlist's songs




// Should sort the songs array alphabetically ascending by title. If two songs have the same title, then they should be sorted alphabetically ascending by artist.
- (void) sortSongsByTitle:(NSMutableArray *)songList;

// Should sort the songs array alphabetically ascending by artist. If two songs have the same Artist, then they should be sorted alphabetically ascending by album.
- (void) sortSongsByArtist:(NSMutableArray *)songList;

// Should sort the songs array alphabetically ascending by Album. If two songs have the same album, then they should be sorted alphabetically ascending by title.
- (void) sortSongsByAlbum:(NSMutableArray *)songList;



- (instancetype) init;
- (NSString *)description;
- (AALSong *)songAtPosition:(NSNumber *)position;


@end
