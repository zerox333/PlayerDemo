//
//  TimeBubbleView.m
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-7-2.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import "TimeBubbleView.h"

@implementation TimeBubbleView
@synthesize timeLabel = _timeLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"player_time_bubble_bg"];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectOffset(self.bounds, 0, -2)];
        [_timeLabel setTextAlignment:NSTextAlignmentCenter];
        [_timeLabel setBackgroundColor:[UIColor clearColor]];
        [_timeLabel setAdjustsFontSizeToFitWidth:YES];
        [_timeLabel setFont:[UIFont systemFontOfSize:9]];
        [_timeLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:_timeLabel];
        [_timeLabel release];
    }
    return self;
}

- (void)dealloc
{
    [_timeLabel release];
    [super dealloc];
}

@end
