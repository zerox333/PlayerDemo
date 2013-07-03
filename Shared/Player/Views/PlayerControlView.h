//
//  PlayerControlView.h
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-6-28.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerControlButton : UIButton

@end

typedef NS_ENUM(NSUInteger, PlayerControlViewType) {
    PlayerControlViewTypeBase,
    PlayerControlViewTypeVOD,
    PlayerControlViewTypeLiveTV,
};

@protocol PlayerControlViewDataSource <NSObject>

@required

- (PlayerControlViewType)controlViewType;
- (float)volume;

@optional

- (NSString *)infoString;
- (NSArray *)bitrateList;
- (NSString *)leftTimeString;
- (NSString *)rightTimeString;
- (NSString *)timeStringByPercentage:(float)percentage;
- (float)VODprogressValue;

@end

@protocol PlayerControlViewDelegate <NSObject>

// 按钮事件回调
- (void)backBtnClicked:(UIButton *)sender;
- (void)episodeBtnClicked:(UIButton *)sender;
- (void)previousBtnClicked:(UIButton *)sender;
- (void)nextBtnClicked:(UIButton *)sender;
- (void)playPauseBtnClicked:(UIButton *)sender;
- (void)scaleBtnClicked:(UIButton *)sender;
- (void)volumeBtnClicked:(UIButton *)sender;

// 进度条事件回调
- (void)progressSliderDown:(UISlider *)sender;
- (void)progressSliderChanged:(UISlider *)sender;
- (void)progressSliderUp:(UISlider *)sender;

// 音量拖动条事件回调
- (void)volumeSliderChanged:(UISlider *)sender;

// 码率选择回调
- (void)didSelecteBitrateAtIndex:(NSUInteger)index;

@end

@interface PlayerControlView : UIView <UITableViewDataSource, UITableViewDelegate>
{
    NSTimer *_controlViewTimer;
    NSUInteger _hideControlTimeLeft;
    UIControl *_subControl;
    id<PlayerControlViewDataSource> _dataSource;
    id<PlayerControlViewDelegate> _delegate;
}

@property(nonatomic, assign) id<PlayerControlViewDelegate> delegate;
@property(nonatomic, retain, readonly) NSTimer *controlViewTimer;

- (id)initWithFrame:(CGRect)frame withDataSource:(id<PlayerControlViewDataSource>)dataSource;
- (void)setActivityIndicatorVisible:(BOOL)isVisible;

@end
