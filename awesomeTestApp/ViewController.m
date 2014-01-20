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

}

- (IBAction)mainMenuScreen:(id)sender
{
    NSLog(@"User enters main menu screen");

}

- (IBAction)freeCoinsClicked:(id)sender
{
    NSLog(@"User Clicks 'Get Free Coins' Button");

}

- (IBAction)userCompletedLevelOne:(id)sender
{
    NSLog(@"User completed level one");

}

@end
