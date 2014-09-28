//
//  ViewController.m
//  BestFriend
//
//  Created by John Ray on 8/29/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet MKMapView *map;

- (IBAction)newBFF:(id)sender;
- (IBAction)sendEmail:(id)sender;
- (IBAction)sendTweet:(id)sender;

- (void)showAddress:(NSDictionary*)fullAddress;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newBFF:(id)sender {
    ABPeoplePickerNavigationController *picker;
    picker=[[ABPeoplePickerNavigationController alloc] init];
	picker.peoplePickerDelegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier {
    //We won't get to this delegate method
	
    return NO;
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
	  shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
	// Retrieve the friend's name from the address book person record
    NSString *friendName;
    NSString *friendEmail;
    //  NSString *friendZip;
    
    friendName=(__bridge NSString *)ABRecordCopyValue
    (person, kABPersonFirstNameProperty);
    self.name.text = friendName;
    
    ABMultiValueRef friendAddressSet;
	NSDictionary *friendFirstAddress;
    friendAddressSet = ABRecordCopyValue
    (person, kABPersonAddressProperty);
    
    if (ABMultiValueGetCount(friendAddressSet)>0) {
        friendFirstAddress = (__bridge NSDictionary *)
        ABMultiValueCopyValueAtIndex(friendAddressSet,0);
        //  friendZip = friendFirstAddress[@"ZIP"];
        [self showAddress:friendFirstAddress];
    }
    
    ABMultiValueRef friendEmailAddresses;
    friendEmailAddresses = ABRecordCopyValue
    (person, kABPersonEmailProperty);
    
    if (ABMultiValueGetCount(friendEmailAddresses)>0) {
        friendEmail=(__bridge NSString *)
        ABMultiValueCopyValueAtIndex(friendEmailAddresses, 0);
        self.email.text = friendEmail;
    }
    
	if (ABPersonHasImageData(person)) {
		self.photo.image = [UIImage imageWithData:
                            (__bridge NSData *)ABPersonCopyImageData(person)];
	}
	
    [self dismissViewControllerAnimated:YES completion:nil];
	return NO;
}

- (void)showAddress:(NSDictionary*)fullAddress {
    CLGeocoder *geocoder;
    geocoder=[CLGeocoder new];
    [geocoder geocodeAddressDictionary:fullAddress
                     completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *friendPlacemark=placemarks[0];
        
        MKCoordinateRegion mapRegion;
        mapRegion.center.latitude=friendPlacemark.location.coordinate.latitude;
        mapRegion.center.longitude=friendPlacemark.location.coordinate.longitude;
        mapRegion.span.latitudeDelta=0.2;
        mapRegion.span.longitudeDelta=0.2;
        [self.map setRegion:mapRegion animated:YES];
        
        MKPlacemark *mapPlacemark = [[MKPlacemark alloc]
                                     initWithPlacemark:friendPlacemark];
        [self.map addAnnotation:mapPlacemark];
        
    }];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinDrop=[[MKPinAnnotationView alloc]
                                  initWithAnnotation:annotation
                                  reuseIdentifier:@"myspot"];
    pinDrop.animatesDrop=YES;
    pinDrop.canShowCallout=YES;
    pinDrop.pinColor=MKPinAnnotationColorPurple;
    return pinDrop;
}

- (IBAction)sendEmail:(id)sender {
    MFMailComposeViewController *mailComposer;
    NSArray *emailAddresses;
    emailAddresses=@[self.email.text];
    
    mailComposer=[[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate=self;
    [mailComposer setToRecipients:emailAddresses];
    [self presentViewController:mailComposer animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)sendTweet:(id)sender {
    CLGeocoder *geocoder;
    geocoder=[CLGeocoder new];
    [geocoder reverseGeocodeLocation:self.map.userLocation.location
         completionHandler:^(NSArray *placemarks, NSError *error) {
             CLPlacemark *myPlacemark=placemarks[0];
             NSString *tweetText;
             tweetText=[NSString stringWithFormat:@"I'm in %@, and I'm on my way.",
                        myPlacemark.locality];

             SLComposeViewController *tweetComposer;
             tweetComposer=[SLComposeViewController
                            composeViewControllerForServiceType:SLServiceTypeTwitter];
             if ([SLComposeViewController
                  isAvailableForServiceType: SLServiceTypeTwitter]) {
                    [tweetComposer setInitialText:tweetText];
                    [self presentViewController:tweetComposer animated:YES completion:nil];
             }
    }];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
