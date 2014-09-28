//
//  ContactViewController.h
//  Contact
//
//  Created by Jeroen van Rijn on 23-05-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
    IBOutlet UIImageView *contactImageView;
    IBOutlet UITextField *firstNameTextField;
    IBOutlet UITextField *lastNameTextField;
    IBOutlet UITextField *ageTextField;
}
- (IBAction)save:(id)sender;
- (IBAction)chooseImage:(id)sender;

@end
