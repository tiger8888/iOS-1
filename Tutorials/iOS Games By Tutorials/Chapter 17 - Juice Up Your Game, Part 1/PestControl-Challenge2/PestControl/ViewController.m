//
//  ViewController.m
//  PestControl
//
//  Created by Main Account on 9/1/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
  skView.showsDrawCount = YES;
  
    // Create and configure the scene.
    SKScene * scene =
      [[MyScene alloc] initWithSize:skView.bounds.size level:0];
    scene.scaleMode = SKSceneScaleModeResizeFill;
  
  // High scores challenge
  NSMutableDictionary *userData = [NSMutableDictionary dictionary];
  userData[@"bestTimes"] = [NSMutableDictionary dictionary];
  scene.userData = userData;
  
  
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden
{
  return YES;
}

@end
