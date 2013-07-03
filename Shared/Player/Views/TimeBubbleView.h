//
//  TimeBubbleView.h
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-7-2.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeBubbleView : UIImageView
{
    UILabel *_timeLabel;
}

@property(nonatomic, retain) UILabel *timeLabel;

@end
