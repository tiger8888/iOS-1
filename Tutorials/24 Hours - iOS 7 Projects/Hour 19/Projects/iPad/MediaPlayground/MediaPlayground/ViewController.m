//
//  ViewController.m
//  MediaPlayground
//
//  Created by Anne Groves on 8/25/13.
//  Copyright (c) 2013 Anne Groves. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    MPMoviePlayerController *_moviePlayer;
    AVAudioRecorder *_audioRecorder;
    AVAudioPlayer *_audioPlayer;
    MPMusicPlayerController *_musicPlayer;
    UIPopoverController *_popoverController;
}
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Set up the audio recorder
    [[AVAudioSession sharedInstance]
     setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];
    
    NSURL *soundFileURL=[NSURL fileURLWithPath:
                         [NSTemporaryDirectory()
                          stringByAppendingString:@"sound.caf"]];
    
    NSDictionary *soundSetting;
    
    soundSetting = @{AVSampleRateKey:@44100.0F,
                     AVFormatIDKey:@(kAudioFormatMPEG4AAC),
                     AVNumberOfChannelsKey:@2,
                     AVEncoderAudioQualityKey:@(AVAudioQualityHigh)
                     };
    
    _audioRecorder = [[AVAudioRecorder alloc]
                      initWithURL: soundFileURL
                      settings: soundSetting
                      error: nil];
    
    //Set up the audio player
    NSURL *noSoundFileURL=[NSURL fileURLWithPath:
                           [[NSBundle mainBundle]
                            pathForResource:@"norecording" ofType:@"wav"]];
    _audioPlayer =  [[AVAudioPlayer alloc]
                     initWithContentsOfURL:noSoundFileURL error:nil];
    
    
    //Set up the music player
    _musicPlayer=[MPMusicPlayerController iPodMusicPlayer];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //Set up the movie player
    NSString *movieFile = [[NSBundle mainBundle]
                           pathForResource:@"movie" ofType:@"m4v"];
    _moviePlayer = [[MPMoviePlayerController alloc]
                    initWithContentURL: [NSURL
                                         fileURLWithPath:
                                         movieFile]];
    _moviePlayer.allowsAirPlay=YES;
    [_moviePlayer.view setFrame: self.movieRegion.frame];
}

-(void)playMovieFinished:(NSNotification*)theNotification
{
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:_moviePlayer];
    
    [_moviePlayer.view removeFromSuperview];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.displayImageView.image=
    info[UIImagePickerControllerOriginalImage];
    
    [_popoverController dismissPopoverAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mediaPicker: (MPMediaPickerController *)mediaPicker
  didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
    [_musicPlayer setQueueWithItemCollection: mediaItemCollection];
  
}
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    [self dismissViewControllerAnimated:YES completion:nil];
    [_popoverController dismissPopoverAnimated:YES];
}


- (IBAction)playMovie:(id)sender {
    [self.view addSubview:_moviePlayer.view];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playMovieFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_moviePlayer];
    
    if ([self.toggleFullscreen isOn]) {
        [_moviePlayer setFullscreen:YES animated:YES];
    }
    
    [_moviePlayer play];
}

- (IBAction)recordAudio:(id)sender {
    if ([self.recordButton.titleLabel.text
         isEqualToString:@"Record Audio"]) {
        [_audioRecorder record];
        [self.recordButton setTitle:@"Stop Recording"
                           forState:UIControlStateNormal];
    } else {
        [_audioRecorder stop];
        [self.recordButton setTitle:@"Record Audio"
                           forState:UIControlStateNormal];
        // Load the new sound in the _audioPlayer for playback
        NSURL *soundFileURL=[NSURL fileURLWithPath:
                             [NSTemporaryDirectory()
                              stringByAppendingString:@"sound.caf"]];
        _audioPlayer =  [[AVAudioPlayer alloc]
                         initWithContentsOfURL:soundFileURL error:nil];
    }
}

- (IBAction)playAudio:(id)sender {
           [_audioPlayer play];
}

- (IBAction)chooseImage:(id)sender {
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    
    if ([self.toggleCamera isOn]) {
        imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate=self;
    
    _popoverController=[[UIPopoverController alloc]
                        initWithContentViewController:imagePicker];
    [_popoverController presentPopoverFromRect:((UIButton *)sender).frame
                                        inView:self.view
                      permittedArrowDirections:UIPopoverArrowDirectionAny
                                      animated:YES];

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

- (IBAction)chooseMusic:(id)sender {
    MPMediaPickerController *musicPicker;
	
	[_musicPlayer stop];
	self.displayNowPlaying.text=@"No Song Playing";
	[self.musicPlayButton setTitle:@"Play Music"
                          forState:UIControlStateNormal];
	
	musicPicker = [[MPMediaPickerController alloc]
				   initWithMediaTypes: MPMediaTypeMusic];
	
	musicPicker.prompt = @"Choose Songs to Play" ;
	musicPicker.allowsPickingMultipleItems = YES;
	musicPicker.delegate = self;
	
	//[self presentViewController:musicPicker animated:YES completion:nil];
    _popoverController=[[UIPopoverController alloc]
                        initWithContentViewController:musicPicker];
    [_popoverController presentPopoverFromRect:((UIButton *)sender).frame
                                        inView:self.view
                      permittedArrowDirections:UIPopoverArrowDirectionAny
                                      animated:YES];
}

- (IBAction)playMusic:(id)sender {
    if ([self.musicPlayButton.titleLabel.text
         isEqualToString:@"Play Music"]) {
        [_musicPlayer play];
        [self.musicPlayButton setTitle:@"Pause Music"
                              forState:UIControlStateNormal];
        self.displayNowPlaying.text=[_musicPlayer.nowPlayingItem
                                     valueForProperty:MPMediaItemPropertyTitle];
        
    } else {
        
        [_musicPlayer pause];
        [self.musicPlayButton setTitle:@"Play Music"
                              forState:UIControlStateNormal];
        self.displayNowPlaying.text=@"No Song Playing";
    }
}
@end
