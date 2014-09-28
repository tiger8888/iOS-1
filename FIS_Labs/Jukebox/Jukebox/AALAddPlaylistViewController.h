//
//  AALAddPlaylistViewController.h
//  Jukebox
//
//  Created by Albert Lardizabal on 6/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AALPlaylistTableViewController.h"

@interface AALAddPlaylistViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *playlistTextField;
@property (nonatomic) NSMutableArray *allSongs;

@end
