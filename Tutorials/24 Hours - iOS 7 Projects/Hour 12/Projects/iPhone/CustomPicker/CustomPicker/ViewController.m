//
//  ViewController.m
//  CustomPicker
//
//  Created by John Ray on 10/11/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
- (IBAction)showAnimalChooser:(id)sender;
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

- (void)displayAnimal:(NSString *)chosenAnimal withSound:(NSString *)chosenSound fromComponent:(NSString *)chosenComponent {
    
    NSString *animalSoundString;
    animalSoundString=[[NSString alloc]
                       initWithFormat:@"You changed %@ (%@ and the sound %@)",
                       chosenComponent,chosenAnimal,chosenSound];
    self.outputLabel.text=animalSoundString;
    
    
}

- (IBAction)showAnimalChooser:(id)sender {
    if (self.animalChooserVisible!=YES) {
        [self performSegueWithIdentifier:@"toAnimalChooser" sender:sender];
        self.animalChooserVisible=YES;
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((AnimalChooserViewController *)segue.destinationViewController).delegate=self;
}


@end
