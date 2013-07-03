//
//  UIScreen+iPhone5Supported.m
//  IPTV
//
//  Created by ding_yuanyi on 13-4-8.
//
//

#import "UIScreen+iPhone5Supported.h"

@implementation UIScreen (iPhone5Supported)

+ (BOOL)isiPhone5
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (height == 568.0f)
    {
        return YES;
    }
    return NO;
}

+ (float)appendedHeightForiPhone5
{
    if ([UIScreen isiPhone5])
    {
        return IPHONE5_HEIGHT_DELTA;
    }
    return 0;
}

@end
