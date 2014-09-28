//
//  ViewController.m
//  Gestures
//
//  Created by John Ray on 7/28/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) CGRect originalRect;

- (IBAction)foundTap:(id)sender;
- (IBAction)foundSwipe:(id)sender;
- (IBAction)foundPinch:(id)sender;
- (IBAction)foundRotation:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    
    self.originalRect=self.imageView.frame;
    
    UIImageView *tempImageView;
    tempImageView=[[UIImageView alloc]
                   initWithImage:[UIImage imageNamed:@"flower.png"]];
    tempImageView.frame=self.originalRect;
    [self.view addSubview:tempImageView];
    
    self.imageView=tempImageView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)foundTap:(id)sender {
    self.outputLabel.text=@"Tapped";
}

- (IBAction)foundSwipe:(id)sender {
    self.outputLabel.text=@"Swiped";
}

- (IBAction)foundPinch:(id)sender {
    UIPinchGestureRecognizer *recognizer;
    NSString *feedback;
    double scale;
    
    recognizer=(UIPinchGestureRecognizer *)sender;
    scale=recognizer.scale;
    self.imageView.transform = CGAffineTransformMakeRotation(0.0);
    feedback=[[NSString alloc]
              initWithFormat:@"Pinched, Scale:%1.2f, Velocity:%1.2f",
              recognizer.scale,recognizer.velocity];
    self.outputLabel.text=feedback;
    self.imageView.frame=CGRectMake(self.originalRect.origin.x,
                                    self.originalRect.origin.y,
                                    self.originalRect.size.width*scale,
                                    self.originalRect.size.height*scale);
}


- (IBAction)foundRotation:(id)sender {
    UIRotationGestureRecognizer *recognizer;
    NSString *feedback;
    double rotation;
    
    recognizer=(UIRotationGestureRecognizer *)sender;
    rotation=recognizer.rotation;
    feedback=[[NSString alloc]
              initWithFormat:@"Rotated, Radians:%1.2f, Velocity:%1.2f",
              recognizer.rotation,recognizer.velocity];
    self.outputLabel.text=feedback;
    self.imageView.transform = CGAffineTransformMakeRotation(rotation);
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion==UIEventSubtypeMotionShake) {
        self.outputLabel.text=@"Shaking things up!";
        self.imageView.transform = CGAffineTransformIdentity;
        self.imageView.frame=self.originalRect;
    }
}


@end
