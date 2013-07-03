//
//  UIImage+Scaled.m
//  PlayerDemo
//
//  Created by ding_yuanyi on 13-7-1.
//  Copyright (c) 2013年 Hoperun. All rights reserved.
//

#import "UIImage+Scaled.h"

@implementation UIImage (Scaled)

- (UIImage *)scaleTo:(float)scale;
{
    CGSize imageSize = self.size;
    imageSize.width *= scale;
    imageSize.height *= scale;
    UIGraphicsBeginImageContext(imageSize);
    [self drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.width)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

@end
