//
//  AALRefillViewController.m
//  MetroCard
//
//  Created by Albert Lardizabal on 9/19/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALRefillViewController.h"

@interface AALRefillViewController ()

@property (weak, nonatomic) IBOutlet UITextField *balanceTextField;
@property (weak, nonatomic) IBOutlet UITextField *bonusTextField;
@property (weak, nonatomic) IBOutlet UITableView *depositTableView;

@end

@implementation AALRefillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Required TableView methods

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // Return the number of rows in the section.
//    return [self.myPlayList.songList count];
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    AALSongDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songsInPlaylistCell" forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    AALSong *songItem = self.myPlayList.songList[indexPath.row];
//    
//    cell.songLabel.text = songItem.title;
//    cell.artistLabel.text = songItem.artist;
//    cell.albumLabel.text = songItem.album;
//    
//    return cell;

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
