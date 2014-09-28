//
//  AALMainViewController.h
//  Jukebox
//
//  Created by Albert Lardizabal on 6/18/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "AALPlaylistTableViewController.h"
#import "AALSong.h"
#import "AALPlaylist.h"
#import "AALSongDetailTableViewCell.h"

#import "MarqueeLabel.h"
#import <QuartzCore/QuartzCore.h>

@interface AALSongViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic) AALPlaylist *myPlayList;
@property (nonatomic) AALSong *selectedSong;

@property (weak, nonatomic) IBOutlet UITextView *mainTextView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)sortByTitleButtonPressed:(UIButton *)sender;
- (IBAction)sortByArtistButtonPressed:(UIButton *)sender;
- (IBAction)sortByAlbumButtonPressed:(UIButton *)sender;

- (IBAction)playButtonPressed:(UIButton *)sender;
- (IBAction)stopButtonPressed:(UIButton *)sender;
- (IBAction)pauseButtonPressed:(UIButton *)sender;

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
                           extension:(NSString *)extension;

@end
