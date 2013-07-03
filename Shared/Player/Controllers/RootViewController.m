//
//  RootViewController.m
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-6-28.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import "RootViewController.h"
#import "VODPlayerViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIBarButtonItem *pushItem = [[UIBarButtonItem alloc] initWithTitle:@"Push" style:UIBarButtonItemStyleBordered target:self action:@selector(pushBtnClicked:)];
    self.navigationItem.rightBarButtonItem = pushItem;
    [pushItem release];
}

- (void)pushBtnClicked:(UIBarButtonItem *)sender
{
    VODPlayerViewController *playerViewController = [[VODPlayerViewController alloc] init];
    [self.navigationController pushViewController:playerViewController animated:YES];
    [playerViewController release];
}

@end
