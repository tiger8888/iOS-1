//
//  AALPlaylist.m
//  Jukebox
//
//  Created by Albert Lardizabal on 6/18/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALPlaylist.h"

@implementation AALPlaylist

- (NSString *)description
{
    // fix
 //   NSString *descriptionString = [[NSString alloc]initWithFormat:@"Artist: %@"];
    
    return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _songList = [[NSMutableArray alloc]init];
    }
    return self;
}

- (AALSong *)songAtPosition:(NSNumber *)position {
    return nil;
}

- (void) sortSongsByAlbum:(NSMutableArray *)songList {
    
    [self sortSongsByAlbum:songList];
    
    NSSortDescriptor *albumSorter = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    
    NSSortDescriptor *titlesorter = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    
    [self.songList sortedArrayUsingDescriptors:@[albumSorter, titlesorter]];
    
}

- (void) sortSongsByTitle:(NSMutableArray *)songList {
    
    NSSortDescriptor *titleSorter = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSSortDescriptor *artistSorter = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    
    [self.songList sortedArrayUsingDescriptors:@[titleSorter, artistSorter]];
    
}

- (void) sortSongsByArtist:(NSMutableArray *)songList {
    
    NSSortDescriptor *artistSorter = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSSortDescriptor *albumSorter = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    
    [self.songList sortedArrayUsingDescriptors:@[artistSorter, albumSorter]];
    
}

@end
