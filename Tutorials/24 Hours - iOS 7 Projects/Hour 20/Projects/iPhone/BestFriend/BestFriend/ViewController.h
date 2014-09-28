//
//  ViewController.h
//  BestFriend
//
//  Created by John Ray on 8/29/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AddressBook;
@import AddressBookUI;
@import MapKit;
@import CoreLocation;
@import MessageUI;
@import Social;

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate, MFMailComposeViewControllerDelegate>

@end
