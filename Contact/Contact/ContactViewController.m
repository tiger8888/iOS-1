//
//  ContactViewController.m
//  Contact
//
//  Created by Jeroen van Rijn on 23-05-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactViewController.h"

@implementation ContactViewController

- (void)dealloc
{
    [contactImageView release];
    [firstNameTextField release];
    [lastNameTextField release];
    [ageTextField release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Get the stored data before the view loads
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *frontName = [defaults objectForKey:@"firstname"];
    NSString *lastName = [defaults objectForKey:@"lastname"];
    
    int age = [defaults integerForKey:@"age"];
    NSString *ageString = [NSString stringWithFormat:@"%i",age];
    
    NSData *imageData = [defaults dataForKey:@"image"];
	UIImage *contactImage = [UIImage imageWithData:imageData];
    
    // Update the UI elements with the saved data
    firstNameTextField.text = frontName;
    lastNameTextField.text = lastName;
    ageTextField.text = ageString;
    contactImageView.image = contactImage;
}


- (void)viewDidUnload
{
    [contactImageView release];
    contactImageView = nil;
    [firstNameTextField release];
    firstNameTextField = nil;
    [lastNameTextField release];
    lastNameTextField = nil;
    [ageTextField release];
    ageTextField = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)save:(id)sender 
{
    // Hide the keyboard
    [firstNameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [ageTextField resignFirstResponder];
    
    // Create strings and integer to store the text info
    NSString *frontName = [firstNameTextField text];
    NSString *lastName = [lastNameTextField text];
    int age = [[ageTextField text] integerValue];
    
    // Create instace of NSData
    UIImage *contactImage = contactImageView.image;
	NSData *imageData = UIImageJPEGRepresentation(contactImage, 100);

    
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:frontName forKey:@"firstname"];
    [defaults setObject:lastName forKey:@"lastname"];
    [defaults setInteger:age forKey:@"age"];
    [defaults setObject:imageData forKey:@"image"];
    
    [defaults synchronize];
    
    NSLog(@"Data saved");
}

- (IBAction)chooseImage:(id)sender 
{
    UIImagePickerController *picker = [[[UIImagePickerController alloc] init] autorelease];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:picker animated:YES];
}

#pragma mark - Image Picker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    contactImageView.image = image;

	[picker dismissModalViewControllerAnimated:YES];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{

	[picker dismissModalViewControllerAnimated:YES];
}


@end
