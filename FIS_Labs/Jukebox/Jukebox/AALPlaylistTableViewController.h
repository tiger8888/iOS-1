//
//  AALPlaylistTableViewController.h
//  Jukebox
//
//  Created by Albert Lardizabal on 6/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AALPlaylist.h"
#import "AALSongViewController.h"
#import "AALSong.h"
#import "AALAddPlaylistViewController.h"

@interface AALPlaylistTableViewController : UITableViewController

@property (nonatomic) NSMutableArray *allPlaylistsArray;

@end
