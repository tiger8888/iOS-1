//
//  AALSong.h
//  Jukebox
//
//  Created by Albert Lardizabal on 6/18/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AALSong : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *artist;
@property (nonatomic) NSString *album;
@property (nonatomic) NSString *fileName;
@property (nonatomic) NSString *extension;

- (instancetype) init;

- (instancetype) initWithTitle:(NSString *)title
                        artist:(NSString *)artist
                         album:(NSString *)album
                      fileName:(NSString *)filename
                     extension:(NSString *)extension;

@end
