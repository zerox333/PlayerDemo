//
//  BitrateListView.m
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-7-2.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import "BitrateListView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BitrateListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.8];
        self.scrollEnabled = NO;
        self.layer.cornerRadius = 5;
    }
    return self;
}

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
