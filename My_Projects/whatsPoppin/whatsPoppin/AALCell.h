//
//  Cell.h
//  whatsPoppin
//
//  Created by Albert Lardizabal on 7/23/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AALCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;
@property (weak, nonatomic) IBOutlet UILabel *portraitCellText;

@property (weak, nonatomic) IBOutlet UIImageView *landscapeImageView;
@property (weak, nonatomic) IBOutlet UILabel *landscapeCellText;

@end
