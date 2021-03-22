//
//  UIImage+Color.h
//  life
//
//  Created by liuweihong on 2021/3/22.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Color)

+ (UIImage *)lf_imageWithColor:(UIColor *)color;
+ (UIImage *)lf_imageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
