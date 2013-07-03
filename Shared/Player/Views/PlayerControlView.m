//
//  PlayerControlView.m
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-6-28.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import "PlayerControlView.h"
#import "UIImage+Scaled.h"
#import "OBSlider.h"
#import "InfoTextView.h"
#import "BitrateListView.h"
#import "TimeBubbleView.h"

#ifdef IPAD

#define TOPVIEW_RECT            CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.bounds), 56.0f)
#define CONTROLBAR_RECT         CGRectMake(0.0f, CGRectGetMaxY(self.bounds) - 122.0f, CGRectGetWidth(self.bounds), 122.0f)

#define BACKBUTTON_RECT         CGRectMake(22.0f, 10.0f, 61.0f, 32.0f)
#define VODNAMELABEL_RECT       CGRectMake(120.0f, 8.0f, CGRectGetWidth(self.bounds) - 240.0f, 28.0f)
#define EPISODEBUTTON_RECT      CGRectMake(CGRectGetMaxX(self.bounds) - 213.0f, 9.0f, 90.0f, 34.0f)
#define INFOBUTTON_RECT         CGRectMake(CGRectGetMaxX(self.bounds) - 104.0f, 10.0f, 78.0f, 32.0f)

#define SCALEBTN_RECT           CGRectMake(80.0f, 62.0f, 54.0f, 41.0f)
#define PREBTN_RECT             CGRectMake(192.0f, 60.0f, 45.0f, 45.0f)
#define PLAYPAUSEBTN_RECT       CGRectOffset(PREBTN_RECT, 63.0f, 0.0f)
#define NEXTBTN_RECT            CGRectOffset(PLAYPAUSEBTN_RECT, 63.0f, 0.0f)

#define PROGRESSSLIDER_RECT     CGRectMake(175.0f, 12.0f, CGRectGetWidth(self.bounds) - 350.0f, 12.0f)
#define VOLUMESLIDER_RECT       CGRectMake(CGRectGetMaxX(self.bounds) - 392.0f, 72.0f, 213.0f, 12.0f)

#define VOLUME_IMAGE_RECT       CGRectMake(CGRectGetMaxX(self.bounds) - 444.0f, 60.0f, 45.0f, 45.0f)

#define CODE_RATE_BTN_RECT      CGRectMake(CGRectGetMaxX(self.bounds) - 149.0f, 68.0f, 112.0f, 31.0f)
#define CODE_RATE_VIEW_RECT     CGRectMake(CGRectGetMaxX(self.bounds) - 149.0f, 560.0f, 118.0f, 138.0f)

#define TS_DOWNLOAD_RATE_RECT   CGRectMake(90.0f, 33.0f, 100.0f, 30.0f)

#define PLAYPAUSEBTNLARGER_RECT CGRectMake(CGRectGetMidX(self.bounds) - 35.5f, CGRectGetMidY(self.bounds) - 35.5f, 70.0f,70.0f)
#define ACTIVITYINDICATOR_RECT  CGRectMake(CGRectGetMidX(self.bounds) - 20.0f, CGRectGetMidY(self.bounds) - 20.0f, 40.0f, 40.0f)

#define LEFTTIMELBL_RECT        CGRectMake(90.0f, 16.0f, 80.0f, 16.0f)
#define RIGHTTIMELBL_RECT       CGRectMake(CGRectGetMaxX(self.bounds) - 149.0f, 16.0f, 120.0f, 16.0f)

#define TIMEBUBBLE_RECT         CGRectMake(0, -52.0f, 100.0f, 44.0f)

#else

#define TOPVIEW_RECT            CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.bounds), 31.0f)
#define CONTROLBAR_RECT         CGRectMake(0.0f, CGRectGetMaxY(self.bounds) - 55.5f, CGRectGetWidth(self.bounds), 55.5f)

#define BACKBUTTON_RECT         CGRectMake(5.0f, 4.0f, 45, 25.0f)
#define VODNAMELABEL_RECT       CGRectMake(60.0f, 0.0f, CGRectGetWidth(self.bounds) - 120.0f, 28.0f)
#define EPISODEBUTTON_RECT      CGRectMake(CGRectGetMaxX(self.bounds) - 117.0f, 4.0f, 53.0f, 25.0f)
#define INFOBUTTON_RECT         CGRectMake(CGRectGetMaxX(self.bounds) - 59.0f, 4.0f, 53.0f, 25.0f)

#define SCALEBTN_RECT           CGRectMake(35.0f, 28.0f, 27.0f, 20.5f)
#define PREBTN_RECT             CGRectMake(75.5f, 28.0f, 22.5f, 22.5f)
#define PLAYPAUSEBTN_RECT       CGRectOffset(PREBTN_RECT, 47.5f, 0.0f)
#define NEXTBTN_RECT            CGRectOffset(PLAYPAUSEBTN_RECT, 47.5f, 0.0f)

#define PROGRESSSLIDER_RECT     CGRectMake(76.0f, 1.0f, CGRectGetWidth(self.bounds) - 152.0f, 10.0f)
#define VOLUMESLIDER_RECT       CGRectMake(CGRectGetMaxX(self.bounds) - 184.0f, 28.0f, 108.0f, 0.0f)

#define VOLUME_IMAGE_RECT       CGRectMake(CGRectGetMaxX(self.bounds) - 210.0f, 28.0f, 22.5f, 22.5f)

#define CODE_RATE_BTN_RECT      CGRectMake(CGRectGetMaxX(self.bounds) - 70.0f, 29.5f, 58.0f, 17.5f)
#define CODE_RATE_VIEW_RECT     CGRectMake(CGRectGetMaxX(self.bounds) - 70.0f, 178.0f, 58.0f, 120.0f)

#define TS_DOWNLOAD_RATE_RECT   CGRectMake(32.0f, 8.0f, 100.0f, 30.0f)

#define PLAYPAUSEBTNLARGER_RECT CGRectMake(CGRectGetMidX(self.bounds) - 35.5f, CGRectGetMidY(self.bounds) - 35.5f, 70.0f,70.0f)
#define ACTIVITYINDICATOR_RECT  CGRectMake(CGRectGetMidX(self.bounds) - 20.0f, CGRectGetMidY(self.bounds) - 20.0f, 40.0f, 40.0f)

#define LEFTTIMELBL_RECT        CGRectMake(34.0f, 9.0f, 120.0f, 9.0f)
#define RIGHTTIMELBL_RECT       CGRectMake(CGRectGetMaxX(self.bounds) - 72.0f, 9.0f, 120.0f, 9.0f)

#define TIMEBUBBLE_RECT         CGRectMake(0, -22.0f, 50.0f, 22.0f)

#endif


#define LEFT_TIME_LABEL_TAG     2001
#define RIGHT_TIME_LABEL_TAG    2002

#define PROGRESS_SLIDER_TAG     2003
#define VOLUME_SLIDER_TAG       2004

#define PLAY_PAUSE_BUTTON_TAG   2005
#define CENTER_PLAY_BUTTON_TAG  2006

#define INFO_BUTTON_TAG         2008
#define BITRATE_BUTTON_TAG      2009

#define INFO_TEXT_VIEW_TAG      2102
#define BITRATE_LIST_VIEW_TAG   2103

#define ACTIVITY_INDICATOR_TAG  3001
#define TIME_BUBBLE_VIEW_TAG    3002

#define TIME_TO_HIDE_CONTROL_VIEW 8

@implementation PlayerControlButton

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (self.superview)
    {
        [self.superview touchesBegan:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    if (self.superview)
    {
        [self.superview touchesMoved:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    if (self.superview)
    {
        [self.superview touchesEnded:touches withEvent:event];
    }
}

@end

@implementation PlayerControlView
@synthesize delegate = _delegate;
@synthesize controlViewTimer = _controlViewTimer;

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withDataSource:nil];
}

- (id)initWithFrame:(CGRect)frame withDataSource:(id<PlayerControlViewDataSource>)dataSource
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _dataSource = dataSource;
        
        UIControl *blankControl = [[UIControl alloc] initWithFrame:frame];
        [blankControl addTarget:self action:@selector(hideControlView:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:blankControl];
        [blankControl release];
        
        _subControl = [[UIControl alloc] initWithFrame:frame];
        [_subControl addTarget:self action:@selector(hideSubControlView:) forControlEvents:UIControlEventTouchDown];
        _subControl.hidden = YES;
        
        [self initTopBar];
        [self initControlBar];
        [self addSubview:_subControl];
        
        _hideControlTimeLeft = TIME_TO_HIDE_CONTROL_VIEW;
        _controlViewTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                             target:self
                                                           selector:@selector(updateHideTimer:)
                                                           userInfo:nil
                                                            repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_controlViewTimer forMode:NSRunLoopCommonModes];
    }
    return self;
}

//set Top View
- (void)initTopBar
{
    UIImageView *topBg = [[[UIImageView alloc] initWithFrame:TOPVIEW_RECT] autorelease];
    topBg.userInteractionEnabled = YES;
    topBg.image = [UIImage imageNamed:@"player_top_bar_bg"];
    
    //draw name label
    UILabel *tmp_namelbl = [[[UILabel alloc] initWithFrame:CGRectInset(topBg.bounds, 40, 0)] autorelease];
    [tmp_namelbl setBackgroundColor:[UIColor clearColor]];
    [tmp_namelbl setFont:[UIFont boldSystemFontOfSize:18]];
    [tmp_namelbl setTextAlignment:NSTextAlignmentCenter];
    [tmp_namelbl setLineBreakMode:NSLineBreakByTruncatingMiddle];
    [tmp_namelbl setTextColor:[UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0]];
    
    //draw back button
    PlayerControlButton *tmp_backBtn = [[[PlayerControlButton alloc] initWithFrame:BACKBUTTON_RECT] autorelease];
    tmp_backBtn.exclusiveTouch = YES;
    [tmp_backBtn setBackgroundImage:[UIImage imageNamed:@"player_back"] forState:UIControlStateNormal];
    [tmp_backBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [tmp_backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tmp_backBtn setTitle:@"  Back" forState:UIControlStateNormal];
    [tmp_backBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [tmp_backBtn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //draw info button
    PlayerControlButton *tmp_infoBtn = [[[PlayerControlButton alloc] initWithFrame:INFOBUTTON_RECT] autorelease];
    tmp_infoBtn.tag = INFO_BUTTON_TAG;
    tmp_infoBtn.exclusiveTouch = YES;
    [tmp_infoBtn setBackgroundImage:[[UIImage imageNamed:@"player_button_common"] stretchableImageWithLeftCapWidth:53 topCapHeight:25] forState:UIControlStateNormal];
    [tmp_infoBtn setBackgroundImage:[[UIImage imageNamed:@"player_button_common_on"] stretchableImageWithLeftCapWidth:53 topCapHeight:25] forState:UIControlStateHighlighted];
    [tmp_infoBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [tmp_infoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tmp_infoBtn setTitle:@"Info" forState:UIControlStateNormal];
    [tmp_infoBtn addTarget:self action:@selector(infoBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //draw episode episode button
    PlayerControlButton *tmp_episodeBtn = [[[PlayerControlButton alloc] initWithFrame:EPISODEBUTTON_RECT] autorelease];
    tmp_episodeBtn.exclusiveTouch = YES;
    [tmp_episodeBtn setBackgroundImage:[[UIImage imageNamed:@"player_button_common"] stretchableImageWithLeftCapWidth:53 topCapHeight:25] forState:UIControlStateNormal];
    [tmp_episodeBtn setBackgroundImage:[[UIImage imageNamed:@"player_button_common_on"] stretchableImageWithLeftCapWidth:53 topCapHeight:25] forState:UIControlStateHighlighted];
    [tmp_episodeBtn setBackgroundImage:[UIImage imageNamed:@"player_button_common"] forState:UIControlStateNormal];
    [tmp_episodeBtn setBackgroundImage:[UIImage imageNamed:@"player_button_common_on"] forState:UIControlStateHighlighted];
    [tmp_episodeBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [tmp_episodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tmp_episodeBtn setTitle:@"Episode" forState:UIControlStateNormal];
    [tmp_episodeBtn addTarget:self action:@selector(episodeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [topBg addSubview:tmp_namelbl];
    [topBg addSubview:tmp_backBtn];
    [topBg addSubview:tmp_infoBtn];
    [topBg addSubview:tmp_episodeBtn];
    
    [self addSubview:topBg];
}

//set Control Bar
- (void)initControlBar
{
    UIImageView *tmp_controlBarBg = [[[UIImageView alloc] initWithFrame:CONTROLBAR_RECT] autorelease];
    tmp_controlBarBg.userInteractionEnabled = YES;
    [tmp_controlBarBg setImage:[UIImage imageNamed:@"player_control_bar_bg"]];
    [self addSubview:tmp_controlBarBg];
    
    //draw scale mode button
    PlayerControlButton *tmp_scaleBtn = [[[PlayerControlButton alloc] initWithFrame:CGRectInset(SCALEBTN_RECT, -15, -15)] autorelease];
    [tmp_scaleBtn setImage:[UIImage imageNamed:@"player_scale_mode_full"] forState:UIControlStateNormal];
    [tmp_scaleBtn setImage:[UIImage imageNamed:@"player_scale_mode_orig"] forState:UIControlStateSelected];
    [tmp_scaleBtn addTarget:self action:@selector(scaleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    tmp_scaleBtn.exclusiveTouch = YES;
    
    //draw previous button
    PlayerControlButton *tmp_preBtn = [[[PlayerControlButton alloc] initWithFrame:PREBTN_RECT] autorelease];
    tmp_preBtn.exclusiveTouch = YES;
    [tmp_preBtn setEnabled:NO];
    [tmp_preBtn setImage:[UIImage imageNamed:@"player_pre_disabled"] forState:UIControlStateDisabled];
    [tmp_preBtn setImage:[UIImage imageNamed:@"player_pre"] forState:UIControlStateNormal];
    [tmp_preBtn addTarget:self action:@selector(previousBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //draw play pause button
    PlayerControlButton *tmp_ppBtn = [[[PlayerControlButton alloc] initWithFrame:PLAYPAUSEBTN_RECT] autorelease];
    tmp_ppBtn.tag = PLAY_PAUSE_BUTTON_TAG;
    tmp_ppBtn.exclusiveTouch = YES;
//    [tmp_ppBtn setEnabled:NO];
    [tmp_ppBtn setImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateNormal];
    [tmp_ppBtn setImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateSelected];
    [tmp_ppBtn setImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateSelected|UIControlStateDisabled];
    [tmp_ppBtn addTarget:self action:@selector(playPauseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //draw next button
    PlayerControlButton *tmp_nextBtn = [[[PlayerControlButton alloc] initWithFrame:NEXTBTN_RECT] autorelease];
    tmp_nextBtn.exclusiveTouch = YES;
    [tmp_nextBtn setEnabled:NO];
    [tmp_nextBtn setImage:[UIImage imageNamed:@"player_next_disabled"] forState:UIControlStateDisabled];
    [tmp_nextBtn setImage:[UIImage imageNamed:@"player_next"] forState:UIControlStateNormal];
    [tmp_nextBtn addTarget:self action:@selector(nextBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *thumbImage = [UIImage imageNamed:@"player_slider_point"];
    UIImage *minImage = [[UIImage imageNamed:@"player_slider_blue"] stretchableImageWithLeftCapWidth:4 topCapHeight:3.5];
    UIImage *maxImage = [[UIImage imageNamed:@"player_slider_bg"] stretchableImageWithLeftCapWidth:4 topCapHeight:3.5];
    
    //draw progress slider
    OBSlider *tmp_progressSlider = [[OBSlider alloc] initWithFrame:PROGRESSSLIDER_RECT];
    tmp_progressSlider.tag = PROGRESS_SLIDER_TAG;
    tmp_progressSlider.exclusiveTouch = YES;
    [tmp_progressSlider setThumbImage:thumbImage forState:UIControlStateNormal];
    [tmp_progressSlider setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [tmp_progressSlider setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    [tmp_progressSlider addTarget:self action:@selector(sliderDown:) forControlEvents:UIControlEventTouchDown];
    [tmp_progressSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [tmp_progressSlider addTarget:self action:@selector(sliderUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [tmp_progressSlider addTarget:self action:@selector(sliderUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
//    [tmp_progressSlider setEnabled:YES];
    
    //draw Volume SliderBar
    OBSlider *tmp_volumeSlider = [[OBSlider alloc] initWithFrame:VOLUMESLIDER_RECT];
    tmp_volumeSlider.tag = VOLUME_SLIDER_TAG;
    tmp_volumeSlider.exclusiveTouch = YES;
    [tmp_volumeSlider setThumbImage:thumbImage forState:UIControlStateNormal];
    [tmp_volumeSlider setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [tmp_volumeSlider setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    [tmp_volumeSlider addTarget:self action:@selector(sliderDown:) forControlEvents:UIControlEventTouchDown];
    [tmp_volumeSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [tmp_volumeSlider addTarget:self action:@selector(sliderUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [tmp_volumeSlider addTarget:self action:@selector(sliderUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
    tmp_volumeSlider.value = [_dataSource volume];
    
    
    UILabel *tmp_leftTimeLabel = [[[UILabel alloc] initWithFrame:LEFTTIMELBL_RECT] autorelease];
    tmp_leftTimeLabel.tag = LEFT_TIME_LABEL_TAG;
    [tmp_leftTimeLabel setBackgroundColor:[UIColor clearColor]];
    [tmp_leftTimeLabel setTextAlignment:NSTextAlignmentLeft];
    [tmp_leftTimeLabel setFont:[UIFont systemFontOfSize:9]];
    [tmp_leftTimeLabel setTextColor:[UIColor whiteColor]];
    [tmp_leftTimeLabel setText:@"00:00:00"];
    
    //draw pltv label
    UILabel *tmp_rightTimeLabel = [[[UILabel alloc] initWithFrame:RIGHTTIMELBL_RECT] autorelease];
    tmp_rightTimeLabel.tag = RIGHT_TIME_LABEL_TAG;
    [tmp_rightTimeLabel setBackgroundColor:[UIColor clearColor]];
    [tmp_rightTimeLabel setTextAlignment:NSTextAlignmentLeft];
    [tmp_rightTimeLabel setFont:[UIFont systemFontOfSize:9]];
    [tmp_rightTimeLabel setTextColor:[UIColor whiteColor]];
    [tmp_rightTimeLabel setText:@"00:00:00"];
    
    //draw the volume bg image
    PlayerControlButton *tmp_volumeBtn = [[[PlayerControlButton alloc] initWithFrame:VOLUME_IMAGE_RECT] autorelease];
    tmp_volumeBtn.exclusiveTouch = YES;
    [tmp_volumeBtn setImage:[UIImage imageNamed:@"player_volume"] forState:UIControlStateNormal];
    [tmp_volumeBtn setImage:[UIImage imageNamed:@"player_volume_mute"] forState:UIControlStateSelected];
    tmp_volumeBtn.selected = !([_dataSource volume] > 0);
    [tmp_volumeBtn addTarget:self action:@selector(volumeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //draw coderate switch button
    PlayerControlButton *tmp_bitrateBtn = [[[PlayerControlButton alloc] initWithFrame:CODE_RATE_BTN_RECT] autorelease];
    tmp_bitrateBtn.tag = BITRATE_BUTTON_TAG;
    tmp_bitrateBtn.exclusiveTouch = YES;
    [tmp_bitrateBtn setBackgroundImage:[UIImage imageNamed:@"player_bitrate"] forState:UIControlStateNormal];
    [tmp_bitrateBtn setBackgroundImage:[UIImage imageNamed:@"player_bitrate_on"] forState:UIControlStateSelected];
    [tmp_bitrateBtn.titleLabel setFont:[UIFont systemFontOfSize:8]];
    [tmp_bitrateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tmp_bitrateBtn setTitle:@"Auto" forState:UIControlStateNormal];
    [tmp_bitrateBtn.titleLabel setTextAlignment:NSTextAlignmentLeft];
    tmp_bitrateBtn.titleEdgeInsets = UIEdgeInsetsMake(3, 0, 0, 25);
    [tmp_bitrateBtn addTarget:self action:@selector(bitrateBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [tmp_controlBarBg addSubview:tmp_preBtn];
    [tmp_controlBarBg addSubview:tmp_ppBtn];
    [tmp_controlBarBg addSubview:tmp_nextBtn];
    [tmp_controlBarBg addSubview:tmp_progressSlider];
    [tmp_controlBarBg addSubview:tmp_volumeSlider];
    [tmp_controlBarBg addSubview:tmp_leftTimeLabel];
    [tmp_controlBarBg addSubview:tmp_rightTimeLabel];
    [tmp_controlBarBg addSubview:tmp_volumeBtn];
    [tmp_controlBarBg addSubview:tmp_bitrateBtn];
    [tmp_controlBarBg addSubview:tmp_scaleBtn];
    
    //ts分片下载速率
//    tmp_tsDownloadRateLabel = nil;
//    if ([[[AppCfg shareInstance].tmp_SystemCfg systemConfigWithKey:CFG_KEY_SHOW_TS_DOWNLOAD_RATE] isEqualToString:@"YES"]) {
//        tmp_tsDownloadRateLabel = [[UILabel alloc] initWithFrame:TS_DOWNLOAD_RATE_RECT];
//        tmp_tsDownloadRateLabel.backgroundColor = [UIColor clearColor];
//        tmp_tsDownloadRateLabel.textColor = [UIColor whiteColor];
//        tmp_tsDownloadRateLabel.font = [UIFont fontWithName:FONT_ARIAL_BOLD size:9];
//        tmp_tsDownloadRateLabel.text = @"";
//        [tmp_controlBarBg addSubview:tmp_tsDownloadRateLabel];
//    }
}

#pragma mark - Public Methods

- (void)setActivityIndicatorVisible:(BOOL)isVisible
{
    UIActivityIndicatorView *activityIndicator = (UIActivityIndicatorView *)[self.superview viewWithTag:ACTIVITY_INDICATOR_TAG];
    if (!activityIndicator)
    {
        activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:ACTIVITYINDICATOR_RECT];
        activityIndicator.tag = ACTIVITY_INDICATOR_TAG;
        [activityIndicator startAnimating];
        [self.superview addSubview:activityIndicator];
        [activityIndicator release];
    }
    activityIndicator.hidden = !isVisible;
    
    PlayerControlButton *playPauseButton = (PlayerControlButton *)[self viewWithTag:PLAY_PAUSE_BUTTON_TAG];
    playPauseButton.enabled = !isVisible;
    OBSlider *progressSlider = (OBSlider *)[self viewWithTag:PROGRESS_SLIDER_TAG];
    progressSlider.enabled = !isVisible;
    PlayerControlButton *bitrateBtn = (PlayerControlButton *)[self viewWithTag:BITRATE_BUTTON_TAG];
    bitrateBtn.enabled = !isVisible;
}

#pragma mark - Button Events

- (void)backBtnClicked:(PlayerControlButton *)sender
{
    [_delegate backBtnClicked:sender];
}

- (void)infoBtnClicked:(PlayerControlButton *)sender
{
    sender.selected = !sender.selected;
    InfoTextView *infoTextView = (InfoTextView *)[self viewWithTag:INFO_TEXT_VIEW_TAG];
    if (!infoTextView)
    {
        CGPoint origin = [sender convertPoint:CGPointMake(CGRectGetMaxX(sender.bounds), CGRectGetMaxY(sender.bounds)) toView:self];
        infoTextView = [[InfoTextView alloc] initWithFrame:CGRectMake(origin.x - 200, origin.y, 200, 150)];
        infoTextView.tag = INFO_TEXT_VIEW_TAG;
        infoTextView.alpha = 0;
        infoTextView.text = [_dataSource infoString];
        [self addSubview:infoTextView];
    }
    
    if (sender.selected)
    {
        infoTextView.contentOffset = CGPointZero;
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        infoTextView.alpha = sender.selected ? 1 : 0;

    }];
    _subControl.hidden = !sender.selected;
}

- (void)episodeBtnClicked:(PlayerControlButton *)sender
{
    [_delegate episodeBtnClicked:sender];
}

- (void)previousBtnClicked:(PlayerControlButton *)sender
{
    [_delegate previousBtnClicked:sender];
}

- (void)nextBtnClicked:(PlayerControlButton *)sender
{
    [_delegate nextBtnClicked:sender];
}

- (void)playPauseBtnClicked:(PlayerControlButton *)sender
{
    PlayerControlButton *playPauseButton = (PlayerControlButton *)[self viewWithTag:PLAY_PAUSE_BUTTON_TAG];
    PlayerControlButton *centerPlayButton = (PlayerControlButton *)[self.superview viewWithTag:CENTER_PLAY_BUTTON_TAG];
    if (!centerPlayButton)
    {
        centerPlayButton = [[PlayerControlButton alloc] initWithFrame:PLAYPAUSEBTNLARGER_RECT];
        centerPlayButton.tag = CENTER_PLAY_BUTTON_TAG;
        centerPlayButton.exclusiveTouch = YES;
        [centerPlayButton setBackgroundImage:[UIImage imageNamed:@"player_center_button"] forState:UIControlStateNormal];
        [centerPlayButton addTarget:self action:@selector(playPauseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.superview addSubview:centerPlayButton];
    }
    
    playPauseButton.selected = !playPauseButton.selected;
    centerPlayButton.hidden = !playPauseButton.selected;
    
    OBSlider *progressSlider = (OBSlider *)[self viewWithTag:PROGRESS_SLIDER_TAG];
    progressSlider.enabled = !playPauseButton.selected;
    
    [_delegate playPauseBtnClicked:sender];
}

- (void)scaleBtnClicked:(PlayerControlButton *)sender
{
    sender.selected = !sender.selected;
    [_delegate scaleBtnClicked:sender];
}

- (void)volumeBtnClicked:(PlayerControlButton *)sender
{
    sender.selected = !sender.selected;
    [_delegate volumeBtnClicked:sender];
    OBSlider *progressSlider = (OBSlider *)[self viewWithTag:VOLUME_SLIDER_TAG];
    progressSlider.value = [_dataSource volume];
}

- (void)bitrateBtnClicked:(PlayerControlButton *)sender
{
    sender.selected = !sender.selected;
    BitrateListView *bitrateList = (BitrateListView *)[self viewWithTag:BITRATE_LIST_VIEW_TAG];
    if (!bitrateList)
    {
        bitrateList = [[BitrateListView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(sender.bounds), 0)];
        bitrateList.tag = BITRATE_LIST_VIEW_TAG;
        bitrateList.dataSource = self;
        bitrateList.delegate = self;
        bitrateList.alpha = 0;
        [self addSubview:bitrateList];
    }
    
    if (sender.selected)
    {
        CGPoint origin = [sender convertPoint:CGPointZero toView:self];
        origin.y -= [_dataSource bitrateList].count * 20;
        CGRect bitrateListRect = bitrateList.frame;
        bitrateListRect.origin = origin;
        bitrateListRect.size.height = [_dataSource bitrateList].count * 20;
        bitrateList.frame = bitrateListRect;
        [bitrateList reloadData];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        bitrateList.alpha = sender.selected ? 1 : 0;
    }];
    _subControl.hidden = !sender.selected;
}

#pragma mark - Slider Events

- (void)sliderDown:(OBSlider *)sender
{
    [self resetControlTimeLeft];
    switch (sender.tag)
    {
        case PROGRESS_SLIDER_TAG:
        {
            TimeBubbleView *timeBubble = (TimeBubbleView *)[self viewWithTag:TIME_BUBBLE_VIEW_TAG];
            if (!timeBubble)
            {
                timeBubble = [[TimeBubbleView alloc] initWithFrame:TIMEBUBBLE_RECT];
                timeBubble.tag = TIME_BUBBLE_VIEW_TAG;
                timeBubble.timeLabel.text = @"00:00:00";
                [sender addSubview:timeBubble];
            }
            timeBubble.hidden = NO;
            [self updateTimeBubble:timeBubble withPercentage:sender.value];
            [_delegate progressSliderDown:sender];
        }
            break;
            
        default:
            break;
    }
}

- (void)sliderChanged:(OBSlider *)sender
{
    [self resetControlTimeLeft];
    switch (sender.tag)
    {
        case PROGRESS_SLIDER_TAG:
        {
            TimeBubbleView *timeBubble = (TimeBubbleView *)[self viewWithTag:TIME_BUBBLE_VIEW_TAG];
            [self updateTimeBubble:timeBubble withPercentage:sender.value];
            [_delegate progressSliderChanged:sender];
        }
            break;
        case VOLUME_SLIDER_TAG:
        {
            [_delegate volumeSliderChanged:sender];
        }
            break;
            
        default:
            break;
    }
}

- (void)sliderUpInside:(OBSlider *)sender
{
    [self resetControlTimeLeft];
    switch (sender.tag)
    {
        case PROGRESS_SLIDER_TAG:
        {
            TimeBubbleView *timeBubble = (TimeBubbleView *)[self viewWithTag:TIME_BUBBLE_VIEW_TAG];
            [self updateTimeBubble:timeBubble withPercentage:sender.value];
            timeBubble.hidden = YES;
            [_delegate progressSliderUp:sender];
        }
            break;
            
        default:
            break;
    }
}

- (void)sliderUpOutside:(OBSlider *)sender
{
    [self resetControlTimeLeft];
    switch (sender.tag)
    {
        case PROGRESS_SLIDER_TAG:
        {
            TimeBubbleView *timeBubble = (TimeBubbleView *)[self viewWithTag:TIME_BUBBLE_VIEW_TAG];
            [self updateTimeBubble:timeBubble withPercentage:sender.value];
            timeBubble.hidden = YES;
            [_delegate progressSliderUp:sender];
        }
            break;
            
        default:
            break;
    }
}

- (void)updateTimeBubble:(TimeBubbleView *)timeBubble withPercentage:(float)percentage
{
    timeBubble.timeLabel.text = [_dataSource timeStringByPercentage:percentage];
    CGRect liveTimeLabelRect = timeBubble.frame;
    liveTimeLabelRect.origin.x = 12 + percentage * (CGRectGetWidth(PROGRESSSLIDER_RECT) - 24) - CGRectGetWidth(TIMEBUBBLE_RECT)/2;
    timeBubble.frame = liveTimeLabelRect;
}

#pragma mark - Handle Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self resetControlTimeLeft];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self resetControlTimeLeft];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self resetControlTimeLeft];
}

- (void)hideSubControlView:(UIControl *)sender
{
    
    PlayerControlButton *infoBtn = (PlayerControlButton *)[self viewWithTag:INFO_BUTTON_TAG];
    if (infoBtn.selected)
    {
        [self infoBtnClicked:infoBtn];
    }
    
    PlayerControlButton *bitrateBtn = (PlayerControlButton *)[self viewWithTag:BITRATE_BUTTON_TAG];
    if (bitrateBtn.selected)
    {
        [self bitrateBtnClicked:bitrateBtn];
    }
}

#pragma mark - Timer Events

- (void)resetControlTimeLeft
{
    _hideControlTimeLeft = TIME_TO_HIDE_CONTROL_VIEW;
}

- (void)hideControlView:(UIControl *)sender
{
    if (self.alpha > 0)
    {
        [self hideSubControlView:nil];
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 0;
        }];
        [self resetControlTimeLeft];
    }
}

- (void)updateHideTimer:(NSTimer *)timer
{ 
    if ([_dataSource controlViewType] == PlayerControlViewTypeVOD) // VOD播放控制视图
    {
        // 更新当前播放时间
        UILabel *leftTimeLabel = (UILabel *)[self viewWithTag:LEFT_TIME_LABEL_TAG];
        NSString *currentPlaybackTime = [_dataSource leftTimeString];
        if (currentPlaybackTime)
        {
            leftTimeLabel.text = currentPlaybackTime;
        }
        
        // 更新总时长
        UILabel *tmp_rightTimeLabel = (UILabel *)[self viewWithTag:RIGHT_TIME_LABEL_TAG];
        NSString *duration = [_dataSource rightTimeString];
        if (duration && ![duration isEqualToString:tmp_rightTimeLabel.text])
        {
            tmp_rightTimeLabel.text = duration;
        }
        
        // 更新进度条值
        OBSlider *progressSlider = (OBSlider *)[self viewWithTag:PROGRESS_SLIDER_TAG];
        UIActivityIndicatorView *activityIndicator = (UIActivityIndicatorView *)[self.superview viewWithTag:ACTIVITY_INDICATOR_TAG];
        float progressValue = [_dataSource VODprogressValue];
        if (progressValue >= 0.0f && progressValue <= 1.0f && !progressSlider.tracking && activityIndicator.hidden)
        {
            // 仅当进度条值合法、非用户操作且非加载状态下更新进度条值
            progressSlider.value = [_dataSource VODprogressValue];
        }
    }
    
    // 定时隐藏控制视图
    if (self.alpha > 0)
    {
        if (_hideControlTimeLeft > 0)
        {
            _hideControlTimeLeft--;
        }
        else
        {
            [self hideControlView:nil];
        }
    }
}

#pragma mark - TableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource bitrateList].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"BitarateListViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        cell.textLabel.font = [UIFont systemFontOfSize:8];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = [UIColor clearColor];
    }
    @try {
        NSString *bitrateString = [[_dataSource bitrateList] objectAtIndex:indexPath.row];
        cell.textLabel.text = bitrateString;
    }
    @catch (NSException *exception) {
        NSLog(@"Bitrate List Exception : %@", exception);
    }
    @finally {
        return cell;
    }

    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideSubControlView:nil];
    [_delegate didSelecteBitrateAtIndex:indexPath.row];
}

#pragma mark - Dealloc

- (void)dealloc
{
    [_subControl release];
    [super dealloc];
}

@end
