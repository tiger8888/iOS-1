//
//  AALSongDetailTableViewCell.h
//  Jukebox
//
//  Created by Albert Lardizabal on 6/20/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AALSongDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *songLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;

@end
