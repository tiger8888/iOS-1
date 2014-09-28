//
//  ViewController.m
//  MediaPlayground
//
//  Created by John Ray on 8/19/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *toggleFullscreen;
@property (weak, nonatomic) IBOutlet UISwitch *toggleCamera;
@property (weak, nonatomic) IBOutlet UIImageView *displayImageView;
@property (weak, nonatomic) IBOutlet UILabel *displayNowPlaying;
@property (weak, nonatomic) IBOutlet UIButton *musicPlayButton;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIView *movieRegion;
    
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) MPMusicPlayerController *musicPlayer;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

- (IBAction)playMovie:(id)sender;
- (IBAction)recordAudio:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)chooseImage:(id)sender;
- (IBAction)applyFilter:(id)sender;
- (IBAction)chooseMusic:(id)sender;
- (IBAction)playMusic:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    
    //Setup the audio recorder
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];
    
    NSURL *soundFileURL=[NSURL fileURLWithPath:
                         [NSTemporaryDirectory()
                          stringByAppendingString:@"sound.caf"]];
	
	NSDictionary *soundSetting;
    soundSetting = @{AVSampleRateKey:@44100.0F,
                     AVFormatIDKey:@(kAudioFormatMPEG4AAC),
                     AVNumberOfChannelsKey:@2,
                     AVEncoderAudioQualityKey:@(AVAudioQualityHigh)
                     };
	
	self.audioRecorder = [[AVAudioRecorder alloc]
                      initWithURL: soundFileURL
                      settings: soundSetting
                      error: nil];
    
    //Setup the audio player
    NSURL *noSoundFileURL=[NSURL fileURLWithPath:
                           [[NSBundle mainBundle]
                            pathForResource:@"norecording" ofType:@"wav"]];
    self.audioPlayer =  [[AVAudioPlayer alloc]
                     initWithContentsOfURL:noSoundFileURL error:nil];
    
    
    //Setup the music player
	self.musicPlayer=[MPMusicPlayerController iPodMusicPlayer];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *movieFile = [[NSBundle mainBundle]
                           pathForResource:@"movie" ofType:@"m4v"];
	self.moviePlayer = [[MPMoviePlayerController alloc]
                    initWithContentURL: [NSURL
                                         fileURLWithPath:
                                         movieFile]];
    self.moviePlayer.allowsAirPlay=YES;
    [self.moviePlayer.view setFrame: self.movieRegion.frame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playMovie:(id)sender {
    [self.view addSubview:self.moviePlayer.view];
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playMovieFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.moviePlayer];
    
    if ([self.toggleFullscreen isOn]) {
        [self.moviePlayer setFullscreen:YES animated:YES];
	}
    
    [self.moviePlayer play];
}

-(void)playMovieFinished:(NSNotification*)theNotification
{
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:self.moviePlayer];
    
    [self.moviePlayer.view removeFromSuperview];
}

- (IBAction)recordAudio:(id)sender {
    if ([self.recordButton.titleLabel.text
         isEqualToString:@"Record Audio"]) {
		[self.audioRecorder record];
		[self.recordButton setTitle:@"Stop Recording"
                           forState:UIControlStateNormal];
	} else {
		[self.audioRecorder stop];
 		[self.recordButton setTitle:@"Record Audio"
                           forState:UIControlStateNormal];
        // Load the new sound in the audioPlayer for playback
        NSURL *soundFileURL=[NSURL fileURLWithPath:
                             [NSTemporaryDirectory()
                              stringByAppendingString:@"sound.caf"]];
        self.audioPlayer =  [[AVAudioPlayer alloc]
                         initWithContentsOfURL:soundFileURL error:nil];
	}
}

- (IBAction)playAudio:(id)sender {
    //    self.audioPlayer.delegate=self;
	[self.audioPlayer play];
}

/*
 - (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
 successfully:(BOOL)flag {
 player=nil;
 }
 */

- (IBAction)chooseImage:(id)sender {
    UIImagePickerController *imagePicker;
    imagePicker = [UIImagePickerController new];
    
    if ([self.toggleCamera isOn]) {
        imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
	} else {
        imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    }
	imagePicker.delegate=self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)applyFilter:(id)sender {
    CIImage *imageToFilter;
    imageToFilter=[[CIImage alloc]
                   initWithImage:self.displayImageView.image];
    
    CIFilter *activeFilter = [CIFilter filterWithName:@"CISepiaTone"];
    [activeFilter setDefaults];
    [activeFilter setValue: @0.75F
                    forKey: @"inputIntensity"];
    [activeFilter setValue:imageToFilter forKey: @"inputImage"];
    CIImage *filteredImage=[activeFilter valueForKey: @"outputImage"];
    
    UIImage *myNewImage = [UIImage imageWithCIImage:filteredImage];
    self.displayImageView.image = myNewImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.displayImageView.image=
    info[UIImagePickerControllerOriginalImage];
}

- (IBAction)chooseMusic:(id)sender {
    MPMediaPickerController *musicPicker;
	
	[self.musicPlayer stop];
	self.displayNowPlaying.text=@"No Song Playing";
	[self.musicPlayButton setTitle:@"Play Music"
                          forState:UIControlStateNormal];
	
	musicPicker = [[MPMediaPickerController alloc]
				   initWithMediaTypes: MPMediaTypeMusic];
	
	musicPicker.prompt = @"Choose Songs to Play" ;
	musicPicker.allowsPickingMultipleItems = YES;
	musicPicker.delegate = self;
	
	[self presentViewController:musicPicker animated:YES completion:nil];
}

- (void)mediaPicker: (MPMediaPickerController *)mediaPicker
  didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
	[self.musicPlayer setQueueWithItemCollection: mediaItemCollection];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)playMusic:(id)sender {
    if ([self.musicPlayButton.titleLabel.text
         isEqualToString:@"Play Music"]) {
		[self.musicPlayer play];
		[self.musicPlayButton setTitle:@"Pause Music"
                              forState:UIControlStateNormal];
		self.displayNowPlaying.text=[self.musicPlayer.nowPlayingItem
                                     valueForProperty:MPMediaItemPropertyTitle];
        
	} else {
        
		[self.musicPlayer pause];
		[self.musicPlayButton setTitle:@"Play Music"
                              forState:UIControlStateNormal];
		self.displayNowPlaying.text=@"No Song Playing";
	}
}


@end
