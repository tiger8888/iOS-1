//
//  ViewController.m
//  Survey
//
//  Created by John Ray on 9/4/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *resultsView;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;

- (IBAction)storeSurvey:(id)sender;
- (IBAction)showResults:(id)sender;
- (IBAction)hideKeyboard:(id)sender;
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

- (IBAction)storeSurvey:(id)sender {
    
    NSString *csvLine=[NSString stringWithFormat:@"%@,%@,%@\n",
                       self.firstName.text,
                       self.lastName.text,
                       self.email.text];
    
    NSString *docDir = NSSearchPathForDirectoriesInDomains(
                                                           NSDocumentDirectory,
                                                           NSUserDomainMask, YES
                                                           )[0];
    NSString *surveyFile = [docDir
                            stringByAppendingPathComponent:
                            @"surveyresults.csv"];
    
    if  (![[NSFileManager defaultManager] fileExistsAtPath:surveyFile]) {
        [[NSFileManager defaultManager]
         createFileAtPath:surveyFile contents:nil attributes:nil];
    }
    
    NSFileHandle *fileHandle = [NSFileHandle
                                fileHandleForUpdatingAtPath:surveyFile];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[csvLine
                           dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];
    
    self.firstName.text=@"";
    self.lastName.text=@"";
    self.email.text=@"";
}

- (IBAction)showResults:(id)sender {
    NSString *docDir = NSSearchPathForDirectoriesInDomains(
                                                           NSDocumentDirectory,
                                                           NSUserDomainMask, YES
                                                           )[0];
    NSString *surveyFile = [docDir
                            stringByAppendingPathComponent:
                            @"surveyresults.csv"];
    
    if  ([[NSFileManager defaultManager] fileExistsAtPath:surveyFile]) {
        NSFileHandle *fileHandle = [NSFileHandle
                                    fileHandleForReadingAtPath:surveyFile];
        NSString *surveyResults=[[NSString alloc]
                                 initWithData:[fileHandle availableData]
                                 encoding:NSUTF8StringEncoding];
        [fileHandle closeFile];
        self.resultsView.text=surveyResults;
    }
}

- (IBAction)hideKeyboard:(id)sender {
    [self.lastName resignFirstResponder];
    [self.firstName resignFirstResponder];
    [self.email resignFirstResponder];
}

@end
