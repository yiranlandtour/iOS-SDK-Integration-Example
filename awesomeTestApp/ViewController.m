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

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadLaunchAds:) name:@"NX Session Success" object:nil];
}

- (void)loadLaunchAds:(NSNotification *)notification{
    [[NativeXSDK sharedInstance] fetchAdWithPlacement:kAdPlacementMainMenuScreen delegate:self];
    [[NativeXSDK sharedInstance] fetchAdWithCustomPlacement:@"Get Free Coins" delegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mainMenuScreen:(id)sender
{
    NSLog(@"User enters main menu screen");
    [[NativeXSDK sharedInstance] showAdWithPlacement:kAdPlacementMainMenuScreen];

}

- (IBAction)freeCoinsClicked:(id)sender
{
    NSLog(@"User Clicks 'Get Free Coins' Button");
    [[NativeXSDK sharedInstance] showAdWithCustomPlacement:@"Get Free Coins"];

}

- (IBAction)userCompletedLevelOne:(id)sender
{
    NSLog(@"User completed level one");

    if(arc4random() % 2 == 1){
        [[NativeXSDK sharedInstance] showAdWithPlacement:kAdPlacementLevelCompleted];
    }else{
        [[NativeXSDK sharedInstance] showAdWithPlacement:kAdPlacementLevelFailed];
    }

}

-(IBAction)startLevelOne:(id)sender{
    [[NativeXSDK sharedInstance] fetchAdWithPlacement:kAdPlacementLevelCompleted delegate:self];
    [[NativeXSDK sharedInstance] fetchAdWithPlacement:kAdPlacementLevelFailed delegate:self];
}

//TODO: Add delegate methods

- (void)nativeXAdView:(NativeXAdView *)adView didLoadWithPlacement:(NSString *)placement
{
    NativeXSDK* SDK = [NativeXSDK sharedInstance];

    if ([SDK convertAdPlacementToString:kAdPlacementMainMenuScreen] == placement) {
        [self.mainMenuToggle setOn:YES];
    }else if ([placement isEqualToString:@"Get Free Coins"]){
        [self.freeCoinsToggle setOn:YES];
    }else if ([SDK convertAdPlacementToString:kAdPlacementLevelCompleted] == placement){
        [self.levelCompleteToggle setOn:YES];
    }else if ([SDK convertAdPlacementToString:kAdPlacementLevelFailed] == placement){
        [self.levelFailedToggle setOn:YES];
    }

}

//used to set a specific parent view controller for the AdView
//- (UIViewController *)presentingViewControllerForAdView:(NativeXAdView *) adView
//{
//    //Return the UIViewController you would like us to use when presenting the NativeX ad view
//    return self;
//}

//Called if there was no ad to load.
- (void)nativeXAdViewNoAdContent:(NativeXAdView *)adView
{
    NSLog(@"[%@] nativeXAdViewNoAdContent", adView.placement);
}

//Called if the enhanced ad view failed to load
- (void)nativeXAdView:(NativeXAdView *)adView didFailWithError:(NSError *)error
{
    NSLog(@"[%@] nativeXAdView:didFailWithError: %@", adView.placement, error);
}

- (void)nativeXAdViewDidExpire:(NativeXAdView *)adView
{
    NSLog(@"[%@] nativeXAdViewDidExpire", adView.placement);

    NativeXSDK* SDK = [NativeXSDK sharedInstance];

    if ([SDK convertAdPlacementToString:kAdPlacementMainMenuScreen] == adView.placement) {
        [self.mainMenuToggle setOn:NO];
    }else if ([adView.placement isEqualToString:@"Get Free Coins"]){
        [self.freeCoinsToggle setOn:NO];
    }else if ([SDK convertAdPlacementToString:kAdPlacementLevelCompleted] == adView.placement){
        [self.levelCompleteToggle setOn:NO];
    }else if ([SDK convertAdPlacementToString:kAdPlacementLevelFailed] == adView.placement){
        [self.levelFailedToggle setOn:NO];
    }

    [[NativeXSDK sharedInstance] fetchAdWithCustomPlacement:adView.placement delegate:self];
}

//Called right before ad is about to display
- (void)nativeXAdViewWillDisplay:(NativeXAdView *)adView
{
    NSLog(@"Test App: [%@] nativeXAdViewWillDisplay", adView.placement);
}

//called after ad is fully displayed
- (void)nativeXAdViewDidDisplay:(NativeXAdView *)adView
{
    NSLog(@"[%@] nativeXAdViewDidDisplay", adView.placement);
}

//Called right before the view will dismiss
- (void)nativeXAdViewWillDismiss:(NativeXAdView *)adView
{
    NSLog(@"[%@] nativeXAdViewWillDismiss", adView.placement);
}

//Called after ad is fully dismissed
- (void)nativeXAdViewDidDismiss:(NativeXAdView *)adView
{
    NSLog(@"[%@] nativeXAdViewDidDismiss", adView.placement);
    NativeXSDK* SDK = [NativeXSDK sharedInstance];

    if ([SDK convertAdPlacementToString:kAdPlacementMainMenuScreen] == adView.placement) {
        [self.mainMenuToggle setOn:NO];
    }else if ([adView.placement isEqualToString:@"Get Free Coins"]){
        [self.freeCoinsToggle setOn:NO];
    }else if ([SDK convertAdPlacementToString:kAdPlacementLevelCompleted] == adView.placement){
        [self.levelCompleteToggle setOn:NO];
    }else if ([SDK convertAdPlacementToString:kAdPlacementLevelFailed] == adView.placement){
        [self.levelFailedToggle setOn:NO];
    }

    [[NativeXSDK sharedInstance] fetchAdWithCustomPlacement:adView.placement delegate:self];
}

@end
