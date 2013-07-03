//
//  UIScreen+iPhone5Supported.h
//  IPTV
//
//  Created by ding_yuanyi on 13-4-8.
//
//

#import <UIKit/UIKit.h>

#define APPLICATION_FRAME           CGRectOffset([[UIScreen mainScreen] applicationFrame], 0, -20)  // 应用Frame, 去除状态栏高度
#define IPHONE5_HEIGHT_DELTA        88  // iPhone5 追加高度值

@interface UIScreen (iPhone5Supported)

// 是否为iPhone5
+ (BOOL)isiPhone5;
// 追加高度
+ (float)appendedHeightForiPhone5;

@end
