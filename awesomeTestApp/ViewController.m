//
//  ViewController.m
//  awesomeTestApp
//
//  Created by Ash Lindquist on 1/20/14.
//  Copyright (c) 2014 NativeX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)gameLaunched:(id)sender
{
    NSLog(@"Game launches");
    [[NativeXSDK sharedInstance] showAdWithPlacement:kAdPlacementGameLaunch];

}

- (IBAction)mainMenuScreen:(id)sender
{
    NSLog(@"User enters main menu screen");
    [[NativeXSDK sharedInstance] showAdWithPlacement:kAdPlacementMainMenuScreen];

}

- (IBAction)freeCoinsClicked:(id)sender
{
    NSLog(@"User Clicks 'Get Free Coins' Button");
    [[NativeXSDK sharedInstance] showAdWithCustomPlacement:@"Free Coins Clicked"];

}

- (IBAction)userCompletedLevelOne:(id)sender
{
    NSLog(@"User completed level one");
//    [[NativeXSDK sharedInstance] showAdWithPlacement:kAdPlacementLevelCompleted];
    [[NativeXSDK sharedInstance] showAdWithCustomPlacement:@"Completed Level 1"];

}

@end
