//
//  PlayerBaseViewController.m
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-6-28.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import "BasePlayerViewController.h"

@implementation BasePlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#ifndef IPAD
    self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
#endif
    
    player = [[MPMoviePlayerController alloc] init];
    player.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    player.contentURL = [NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"];
    [player play];

//    if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0f)
//    {
//        player.useApplicationAudioSession = NO;
//    }
    
    player.scalingMode = MPMovieScalingModeAspectFit;
    player.controlStyle = MPMovieControlStyleNone;
    player.view.userInteractionEnabled = NO;
    
    [self.view addSubview:player.view];
    
    UIControl *control = [[UIControl alloc] initWithFrame:player.view.bounds];
    [control addTarget:self action:@selector(showControlView:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:control];
    [control release];
    
    _controlView = [[PlayerControlView alloc] initWithFrame:player.view.bounds withDataSource:self];
    _controlView.delegate = self;
    _controlView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_controlView];
    [_controlView release];
    
    [_controlView setActivityIndicatorVisible:YES];
    [self addPlayerObserver];
}

- (void)addPlayerObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerLoadStateDidChanged:)
                                                 name:MPMoviePlayerLoadStateDidChangeNotification
                                               object:player];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerPlaybackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:player];
}

- (void)removePlayerObserver
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _isStatusBarInitialHidden = [UIApplication sharedApplication].statusBarHidden;
    _isNavBarInitialHidden = self.navigationController.navigationBarHidden;
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:_isStatusBarInitialHidden withAnimation:UIStatusBarAnimationNone];
    [self.navigationController setNavigationBarHidden:_isNavBarInitialHidden animated:YES];
}

- (void)dealloc
{
    [self removePlayerObserver];
    [player stop];
    [player release];
    [super dealloc];
}

#pragma mark - Handle Player Notifications

- (void)playerLoadStateDidChanged:(NSNotification *)notification
{
    /* The load state is not known at this time. */
	if (player.loadState & MPMovieLoadStateUnknown)
	{
        [_controlView setActivityIndicatorVisible:YES];
	}
	
	/* The buffer has enough data that playback can begin, but it
	 may run out of data before playback finishes. */
	if (player.loadState & MPMovieLoadStatePlayable)
	{
        [_controlView setActivityIndicatorVisible:YES];
	}
	
	/* Enough data has been buffered for playback to continue uninterrupted. */
	if (player.loadState & MPMovieLoadStatePlaythroughOK)
	{
        [_controlView setActivityIndicatorVisible:NO];
	}
	
	/* The buffering of data has stalled. */
	if (player.loadState & MPMovieLoadStateStalled)
	{
        [_controlView setActivityIndicatorVisible:YES];
	}
}

- (void)playerPlaybackDidFinish:(NSNotification *)notification
{
    NSNumber *reason = [[notification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
	switch ([reason integerValue])
	{
            /* The end of the movie was reached. */
		case MPMovieFinishReasonPlaybackEnded:
            [self backBtnClicked:nil];
			break;
            
            /* An error was encountered during playback. */
		case MPMovieFinishReasonPlaybackError:
            NSLog(@"An error was encountered during playback");
            TSAlertView *alert = [[TSAlertView alloc] initWithTitle:@"Error"
                                                            message:@"An error was encountered during playback"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            alert.superview.transform = CGAffineTransformMakeRotation(M_PI_2);
            [alert release];
			break;
            
            /* The user stopped playback. */
		case MPMovieFinishReasonUserExited:
			break;
            
		default:
			break;
	}
}

#pragma mark - PlayerControlView Delegate

- (PlayerControlViewType)controlViewType
{
    return PlayerControlViewTypeBase;
}

- (float)volume
{
    MPMusicPlayerController *mpc = [MPMusicPlayerController applicationMusicPlayer];
    return mpc.volume;
}

- (void)backBtnClicked:(UIButton *)sender
{
    if ([_controlView.controlViewTimer isValid])
    {
        [_controlView.controlViewTimer invalidate];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)infoBtnClicked:(UIButton *)sender{}

- (void)episodeBtnClicked:(UIButton *)sender{}

- (void)previousBtnClicked:(UIButton *)sender{}

- (void)nextBtnClicked:(UIButton *)sender{}

- (void)playPauseBtnClicked:(UIButton *)sender{}

- (void)scaleBtnClicked:(UIButton *)sender
{
    // 按钮状态：选中 —— 拉伸 / 正常 —— 适应屏幕
    player.scalingMode = sender.selected ? MPMovieScalingModeAspectFill : MPMovieScalingModeAspectFit;
}

- (void)volumeBtnClicked:(UIButton *)sender
{
    MPMusicPlayerController *mpc = [MPMusicPlayerController applicationMusicPlayer];
    mpc.volume = sender.selected ? 0 : _volume;
}

- (void)progressSliderDown:(UISlider *)sender{}

- (void)progressSliderChanged:(UISlider *)sender{}

- (void)progressSliderUp:(UISlider *)sender{}

- (void)volumeSliderChanged:(UISlider *)sender
{
    _volume = sender.value;
    MPMusicPlayerController *mpc = [MPMusicPlayerController applicationMusicPlayer];
    mpc.volume = _volume;
}

- (void)didSelecteBitrateAtIndex:(NSUInteger)index{}

#pragma mark - Actions

// 显示顶栏以及播控栏
- (void)showControlView:(UIControl *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        _controlView.alpha = 1;
    }];
}

@end
