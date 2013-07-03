//
//  PlayerBaseViewController.h
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-6-28.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PlayerControlView.h"

@interface BasePlayerViewController : UIViewController <PlayerControlViewDataSource, PlayerControlViewDelegate>
{
    MPMoviePlayerController *player;
    BOOL _isStatusBarInitialHidden;
    BOOL _isNavBarInitialHidden;
    float _volume;
    PlayerControlView *_controlView;
}

- (void)addPlayerObserver;
- (void)removePlayerObserver;

@end
