//
//  InfoTextView.m
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-7-2.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import "InfoTextView.h"
#import <QuartzCore/QuartzCore.h>

@implementation InfoTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.8];
        self.editable = NO;
        self.textColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.delegate = self;
    }
    return self;
}

- (BOOL)canBecomeFirstResponder
{
    return NO;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.superview)
    {
        [self.superview touchesBegan:nil withEvent:nil];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.superview)
    {
        [self.superview touchesMoved:nil withEvent:nil];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.superview)
    {
        [self.superview touchesEnded:nil withEvent:nil];
    }
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
