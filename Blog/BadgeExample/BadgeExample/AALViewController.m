//
//  AALViewController.m
//  BadgeExample
//
//  Created by Albert Lardizabal on 7/6/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALViewController.h"

@interface AALViewController ()

@end

@implementation AALViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
    
    NSInteger errorCode = httpResponse.statusCode;
    
    NSString *fileMIMEType = [[httpResponse MIMEType] lowercaseString];
    
    NSLog(@"response is %ld, %@", errorCode, fileMIMEType);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    NSLog(@"data is %@", data);
    
    NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"string is %@", myString);
    
    NSError *e = nil;
    
    NSDictionary *bcDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
    
    NSLog(@"dictionary is %@", bcDictionary);
    
    NSNumber *bcTempPrice = bcDictionary[@"amount"];
    float bcPrice = [bcTempPrice floatValue];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = bcPrice;
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    NSLog(@"Connection failed! Error - %@ %@",
          
          [error localizedDescription],
          
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSLog(@"Succeeded!");
    
}

- (IBAction)startButtonPressed:(id)sender {
    
    [self beginUpdating];
    
}

- (void) beginUpdating {
    
    NSURL *myURL = [NSURL URLWithString:@"https://coinbase.com/api/v1/prices/spot_rate"];
    
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    
    NSURLConnection *myConnection = [NSURLConnection connectionWithRequest:myRequest delegate:self];
    
    [NSTimer scheduledTimerWithTimeInterval:15.0 target:self
                                   selector:@selector(beginUpdating) userInfo:nil repeats:YES];
    
}

@end
