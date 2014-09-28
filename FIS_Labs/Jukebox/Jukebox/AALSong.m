//
//  AALSong.m
//  Jukebox
//
//  Created by Albert Lardizabal on 6/18/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALSong.h"

@implementation AALSong

- (instancetype)initWithTitle:(NSString *)title
                       artist:(NSString *)artist
                        album:(NSString *)album
                     fileName:(NSString *)filename
                    extension:(NSString *)extension
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _album = album;
        _fileName = filename;
        _extension = extension;
        
    }
    return self;
}

- (instancetype)init
{
    return [self initWithTitle:@"" artist:@"" album:@"" fileName:@"" extension:@""];
}

@end
