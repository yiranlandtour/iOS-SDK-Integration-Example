//
//  ViewController.h
//  awesomeTestApp
//
//  Created by Ash Lindquist on 1/20/14.
//  Copyright (c) 2014 NativeX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NativeXSDK.h"

@interface ViewController : UIViewController <NativeXAdViewDelegate>

@property (strong, nonatomic) IBOutlet UISwitch *mainMenuToggle;
@property (strong, nonatomic) IBOutlet UISwitch *freeCoinsToggle;
@property (strong, nonatomic) IBOutlet UISwitch *levelCompleteToggle;
@property (strong, nonatomic) IBOutlet UISwitch *levelFailedToggle;

//Ads should be fetched prior to being shown.
- (void)loadLaunchAds:(NSNotification *)notification;
- (IBAction)startLevelOne:(id)sender;

- (IBAction)mainMenuScreen:(id)sender;
- (IBAction)freeCoinsClicked:(id)sender;
- (IBAction)userCompletedLevelOne:(id)sender;

@end
