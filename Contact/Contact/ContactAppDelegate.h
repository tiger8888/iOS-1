//
//  ContactAppDelegate.h
//  Contact
//
//  Created by Jeroen van Rijn on 23-05-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactViewController;

@interface ContactAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ContactViewController *viewController;

@end
