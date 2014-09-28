//
//  ViewController.h
//  MediaPlayground
//
//  Created by Anne Groves on 8/25/13.
//  Copyright (c) 2013 Anne Groves. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreImage;
@import AVFoundation;
@import MediaPlayer;

@interface ViewController : UIViewController
<MPMediaPickerControllerDelegate,UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *toggleFullscreen;
@property (weak, nonatomic) IBOutlet UIView *movieRegion;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UISwitch *toggleCamera;
@property (weak, nonatomic) IBOutlet UIImageView *displayImageView;
@property (weak, nonatomic) IBOutlet UIButton *musicPlayButton;
@property (weak, nonatomic) IBOutlet UILabel *displayNowPlaying;

- (IBAction)playMovie:(id)sender;
- (IBAction)recordAudio:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)chooseImage:(id)sender;
- (IBAction)applyFilter:(id)sender;
- (IBAction)chooseMusic:(id)sender;
- (IBAction)playMusic:(id)sender;
@end
