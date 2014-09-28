//
//  AALMainViewController.m
//  Jukebox
//
//  Created by Albert Lardizabal on 6/18/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALSongViewController.h"

@interface AALSongViewController ()

@property (nonatomic) MarqueeLabel *songDetailMarquee;

@end

@implementation AALSongViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _selectedSong = [[AALSong alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.title = self.myPlayList.name;
    
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Setup Audio Player

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
                           extension:(NSString *)extension;
{
    
    NSURL *audioFileURL = [[NSBundle mainBundle] URLForResource:fileName withExtension:extension];
    
    //    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
    //                                         pathForResource:fileName
    //                                         ofType:@"mp3"]];
    
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:audioFileURL
                        error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

#pragma mark Sort Methods

- (IBAction)sortByTitleButtonPressed:(UIButton *)sender {
    
    NSSortDescriptor *sortByTitle = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSArray *songsSortedByTitle = [self.myPlayList.songList sortedArrayUsingDescriptors:@[sortByTitle]];
    
    [self.myPlayList.songList removeAllObjects];
    [self.myPlayList.songList addObjectsFromArray:songsSortedByTitle];
    
    [self updateSongDetail];
    
}

- (IBAction)sortByArtistButtonPressed:(UIButton *)sender {
    
    self.mainTextView.text = [NSString stringWithFormat:@"%@", self.myPlayList];
    
    NSSortDescriptor *sortByArtist = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
    NSArray *songsSortedByArtist = [self.myPlayList.songList sortedArrayUsingDescriptors:@[sortByArtist]];
    
    [self.myPlayList.songList removeAllObjects];
    [self.myPlayList.songList addObjectsFromArray:songsSortedByArtist];
    
    [self updateSongDetail];
    
}

- (IBAction)sortByAlbumButtonPressed:(UIButton *)sender {
    
    self.mainTextView.text = [NSString stringWithFormat:@"%@", self.myPlayList];
    
    NSSortDescriptor *sortByAlbum = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
    NSArray *songsSortedByAlbum = [self.myPlayList.songList sortedArrayUsingDescriptors:@[sortByAlbum]];
    
    [self.myPlayList.songList removeAllObjects];
    [self.myPlayList.songList addObjectsFromArray:songsSortedByAlbum];
    
    [self updateSongDetail];
}

#pragma mark Audio Buttons

- (void)updateSongDetail {
    
    if (!self.songDetailMarquee) {
        self.songDetailMarquee = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20.0f, 20.0f) duration:15.0 andFadeLength:10.0f];
    }

    self.songDetailMarquee.marqueeType = MLContinuous;
    self.songDetailMarquee.tag = 101;
    self.songDetailMarquee.numberOfLines = 1;
    self.songDetailMarquee.shadowOffset = CGSizeMake(0.0, -1.0);
    self.songDetailMarquee.textAlignment = NSTextAlignmentLeft;
    self.songDetailMarquee.textColor = [UIColor whiteColor];
    self.songDetailMarquee.backgroundColor = [UIColor clearColor];
    self.songDetailMarquee.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0f];
    
    self.songDetailMarquee.text = [NSString stringWithFormat:@"Artist: %@   Song: %@   Album: %@   ", self.selectedSong.artist, self.selectedSong.title, self.selectedSong.album];
    [self.view addSubview:self.songDetailMarquee];
    
    [self.tableView reloadData];
    
}

- (IBAction)playButtonPressed:(UIButton *)sender {
    
    [self setupAVAudioPlayWithFileName:self.selectedSong.fileName
                             extension:self.selectedSong.extension];
    
    [self.audioPlayer play];
    
    [self updateSongDetail];
    
}

- (IBAction)stopButtonPressed:(UIButton *)sender {
    [self.audioPlayer stop];
}

- (IBAction)pauseButtonPressed:(UIButton *)sender {
    [self.audioPlayer pause];
}

#pragma mark Required TableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.myPlayList.songList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AALSongDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songsInPlaylistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    AALSong *songItem = self.myPlayList.songList[indexPath.row];
    
    cell.songLabel.text = songItem.title;
    cell.artistLabel.text = songItem.artist;
    cell.albumLabel.text = songItem.album;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedSong = self.myPlayList.songList[indexPath.row];
    
    [self setupAVAudioPlayWithFileName:self.selectedSong.fileName
                             extension:self.selectedSong.extension];
    
    [self.audioPlayer play];

    [self updateSongDetail];
    
}

@end
