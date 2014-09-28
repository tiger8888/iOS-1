//
//  AALMatch.h
//  NavigationControllerDemo
//
//  Created by Albert Lardizabal on 6/18/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AALMatch : UIViewController

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *gameTime;

- (instancetype) initWithTitle:(NSString *)title
                      gametime:(NSString *)gameTime
                      location:(NSString *)location;

- (instancetype) init;

@end
