//
//  UIImage+Color.m
//  life
//
//  Created by liuweihong on 2021/3/22.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)lf_imageWithColor:(UIColor *)color {
    return [UIImage lf_imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}

+ (UIImage *)lf_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = {.origin = CGPointZero, .size = size};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
