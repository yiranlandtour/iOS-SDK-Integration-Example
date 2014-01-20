//
//  ViewController.h
//  awesomeTestApp
//
//  Created by Ash Lindquist on 1/20/14.
//  Copyright (c) 2014 NativeX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwitch *gameLaunchToggle;
@property (strong, nonatomic) IBOutlet UISwitch *mainMenuToggle;
@property (strong, nonatomic) IBOutlet UIButton *freeCoinsToggle;
@property (strong, nonatomic) IBOutlet UIButton *levelCompleteToggle;

- (IBAction)gameLaunched:(id)sender;
- (IBAction)mainMenuScreen:(id)sender;
- (IBAction)freeCoinsClicked:(id)sender;
- (IBAction)userCompletedLevelOne:(id)sender;

@end
