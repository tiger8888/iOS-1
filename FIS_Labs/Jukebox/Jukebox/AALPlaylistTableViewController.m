//
//  AALPlaylistTableViewController.m
//  Jukebox
//
//  Created by Albert Lardizabal on 6/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALPlaylistTableViewController.h"

@interface AALPlaylistTableViewController ()

@end

@implementation AALPlaylistTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setupPlaylists];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupPlaylists {
    self.allPlaylistsArray = [[NSMutableArray alloc]init];
    
    AALPlaylist *playlistAll = [[AALPlaylist alloc]init];
    AALPlaylist *playlistOne = [[AALPlaylist alloc]init];
    AALPlaylist *playlistTwo = [[AALPlaylist alloc]init];
    AALPlaylist *playlistThree = [[AALPlaylist alloc]init];
    
    playlistAll.name = @"All Songs";
    playlistOne.name = @"Workout";
    playlistTwo.name = @"Dance Party";
    playlistThree.name = @"Girl Talk";
    
    AALSong *song1 = [[AALSong alloc]initWithTitle:@"Thrift Shop (feat. Wanz)" artist:@"Macklemore & Ryan Lewis" album:@"The Heist (Deluxe Edition)" fileName:@"Thrift Shop" extension:@"m4a"];
    AALSong *song2 = [[AALSong alloc]initWithTitle:@"All of Me (Tiësto's Birthday Treatment Remix) [Radio Edit]" artist:@"John Legend" album:@"All of Me (Tiësto's Birthday Treatment Remix) [Radio Edit] - Single" fileName:@"All of Me" extension:@"m4a"];
    AALSong *song3 = [[AALSong alloc]initWithTitle:@"Kids" artist:@"MGMT" album:@"Oracular Spectacular" fileName:@"Kids" extension:@"m4a"];
    AALSong *song4 = [[AALSong alloc]initWithTitle:@"Bizarre Love Triangle" artist:@"New Order" album:@"Bizarre Love Triangle - EP" fileName:@"Bizarre Love Triangle" extension:@"m4a"];
    AALSong *song5 = [[AALSong alloc]initWithTitle:@"Levels" artist:@"Avicii" album:@"Levels - Single" fileName:@"Levels" extension:@"m4a"];
    AALSong *song6 = [[AALSong alloc]initWithTitle:@"Take On Me" artist:@"a-ha" album:@"Hunting High and Low" fileName:@"Take On Me" extension:@"m4a"];
    AALSong *song7 = [[AALSong alloc]initWithTitle:@"Make Me Wanna" artist:@"Girl Talk" album:@"All Day" fileName:@"Make Me Wanna" extension:@"mp3"];
    AALSong *song8 = [[AALSong alloc]initWithTitle:@"Down for the Count" artist:@"Girl Talk" album:@"All Day" fileName:@"Down for the Count" extension:@"mp3"];
    AALSong *song9 = [[AALSong alloc]initWithTitle:@"Steady Shock" artist:@"Girl Talk" album:@"All Day" fileName:@"Steady Shock" extension:@"mp3"];
    AALSong *song10 = [[AALSong alloc]initWithTitle:@"Triple Double" artist:@"Girl Talk" album:@"All Day" fileName:@"Triple Double" extension:@"mp3"];
    
    [playlistAll.songList addObject:song1];
    [playlistAll.songList addObject:song2];
    [playlistAll.songList addObject:song3];
    [playlistAll.songList addObject:song4];
    [playlistAll.songList addObject:song5];
    [playlistAll.songList addObject:song6];
    [playlistAll.songList addObject:song7];
    [playlistAll.songList addObject:song8];
    [playlistAll.songList addObject:song9];
    [playlistAll.songList addObject:song10];
    
    [playlistOne.songList addObject:song2];
    [playlistOne.songList addObject:song3];
    [playlistOne.songList addObject:song5];
    [playlistOne.songList addObject:song6];
    
    [playlistTwo.songList addObject:song1];
    [playlistTwo.songList addObject:song2];
    [playlistTwo.songList addObject:song4];
    [playlistTwo.songList addObject:song5];
    [playlistTwo.songList addObject:song6];
    
    [playlistThree.songList addObject:song7];
    [playlistThree.songList addObject:song8];
    [playlistThree.songList addObject:song9];
    [playlistThree.songList addObject:song10];
    
    [self.allPlaylistsArray addObject:playlistAll];
    [self.allPlaylistsArray addObject:playlistOne];
    [self.allPlaylistsArray addObject:playlistTwo];
    [self.allPlaylistsArray addObject:playlistThree];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.allPlaylistsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    AALPlaylist *playlistItem = self.allPlaylistsArray[indexPath.row];
    NSString *playlistName = playlistItem.name;
    cell.textLabel.text = playlistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:[playlistItem.songList count]]];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    AALSongViewController *destinationVC = segue.destinationViewController;
    
    NSIndexPath *selectedRowInTableView = [self.tableView indexPathForSelectedRow];
    destinationVC.myPlayList = self.allPlaylistsArray[selectedRowInTableView.row];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
