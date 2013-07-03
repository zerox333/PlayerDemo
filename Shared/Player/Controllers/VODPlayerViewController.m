//
//  VODPlayerViewController.m
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-6-28.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import "VODPlayerViewController.h"

@implementation VODPlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bitrateListArray = [[NSMutableArray alloc] initWithObjects:@"300k", @"200k", @"100k", nil];
}

#pragma mark - PlayerControlView DataSource

- (NSString *)infoString
{
    return @"Case Closed, known as Meitantei Conan (名探偵コナン?, lit. Great Detective Conan, officially translated as Detective Conan) in Japan, is a Japanese detective manga series written and illustrated by Gosho Aoyama. The series is serialized in Shogakukan's Weekly Shōnen Sunday since January 19, 1994, and has been collected in 81 tankōbon volumes as of June 2013. Due to legal considerations with the name Detective Conan, the English language release was renamed Case Closed.[1] The story follows the adventures of Jimmy Kudo, a prodigious young detective who was inadvertently transformed into a child after being poisoned.";
}

- (NSArray *)bitrateList
{
    return _bitrateListArray;
}

- (NSString *)leftTimeString
{
    // 非播放状态，返回nil，不更新时间显示
    if (player.playbackState != MPMoviePlaybackStatePlaying)
    {
        return nil;
    }
    return [NSString stringWithFormat:@"%02d:%02d:%02d",
            ((int)player.currentPlaybackTime / 3600),
            (((int)player.currentPlaybackTime % 3600) / 60),
            ((int)player.currentPlaybackTime % 60)];
}

- (NSString *)rightTimeString
{
    // 非播放状态，返回nil，不更新片源时长显示
    if (player.playbackState != MPMoviePlaybackStatePlaying)
    {
        return nil;
    }
    return [NSString stringWithFormat:@"%02d:%02d:%02d",
            ((int)player.duration / 3600),
            (((int)player.duration % 3600) / 60),
            ((int)player.duration % 60)];
}

- (NSString *)timeStringByPercentage:(float)percentage
{
    // 片源时长为零，返回nil
    if (player.duration == 0.0f)
    {
        return nil;
    }
    NSTimeInterval time = percentage * player.duration;
    return [NSString stringWithFormat:@"%02d:%02d:%02d",
            ((int)time / 3600),
            (((int)time % 3600) / 60),
            ((int)time % 60)];
}

- (float)VODprogressValue
{
    return player.currentPlaybackTime / player.duration;
}

#pragma mark - PlayerControlView Delegate

- (PlayerControlViewType)controlViewType
{
    return PlayerControlViewTypeVOD;
}

- (void)backBtnClicked:(UIButton *)sender
{
    [super backBtnClicked:sender];
}

- (void)previousBtnClicked:(UIButton *)sender
{
    [super previousBtnClicked:sender];
}

- (void)nextBtnClicked:(UIButton *)sender
{
    [super nextBtnClicked:sender];
}

- (void)playPauseBtnClicked:(UIButton *)sender
{
    [super playPauseBtnClicked:sender];
    // 按钮状态：选中 —— 暂停播放 / 正常 —— 继续播放
    if (sender.selected)
    {
        [player pause];
    }
    else
    {
        [player play];
    }
}

- (void)progressSliderDown:(UISlider *)sender
{
    [super progressSliderDown:sender];
    [player pause];
}

- (void)progressSliderUp:(UISlider *)sender
{
    [super progressSliderUp:sender];
    player.currentPlaybackTime = sender.value * player.duration;
    [player play];
}

- (void)didSelecteBitrateAtIndex:(NSUInteger)index
{
    [super didSelecteBitrateAtIndex:index];
    [self removePlayerObserver];
    [player stop];
    [player play];
    [_controlView setActivityIndicatorVisible:YES];
    [self addPlayerObserver];
}

@end
