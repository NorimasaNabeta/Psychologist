//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by 式正 鍋田 on 12/07/12.
//  Copyright (c) 2012年 Norimasa Nabeta. All rights reserved.
//

#import "PsychologistViewController.h"
#import "HappinessViewController.h"

@interface PsychologistViewController ()
@property (nonatomic) int diagnosis;
@end

@implementation PsychologistViewController
@synthesize diagnosis=_diagnosis;

- (HappinessViewController *)splitViewHappinessViewController
{
    id hvc = [self.splitViewController.viewControllers lastObject];
    if (![hvc isKindOfClass:[HappinessViewController class]]) {
        hvc = nil;
    }
    return hvc;
}

- (void)setAndShowDiagnosis:(int)diagnosis
{
    self.diagnosis = diagnosis;
    if ([self splitViewHappinessViewController]) {                      // if in split view
        [self splitViewHappinessViewController].happiness = diagnosis;  // just set happiness in detail
    } else {
        [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self]; // else segue using ShowDiagnosis
    }
}

- (IBAction)flying {
    [self setAndShowDiagnosis:85];
}
- (IBAction)apple {
    [self setAndShowDiagnosis:100];
}
- (IBAction)dragon {
    [self setAndShowDiagnosis:20];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowDiagnosis"]) {
        [segue.destinationViewController setHappiness:self.diagnosis];
    } else if ([segue.identifier isEqualToString:@"Celebrity"]) {
        [segue.destinationViewController setHappiness:100];
    } else if ([segue.identifier isEqualToString:@"Serious"]) {
        [segue.destinationViewController setHappiness:20];
    } else if ([segue.identifier isEqualToString:@"TV Kook"]) {
        [segue.destinationViewController setHappiness:50];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;
}

@end
