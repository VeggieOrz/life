//
//  UIColor+RGBA.h
//  life
//
//  Created by liuweihong on 2020/12/3.
//  Copyright © 2020 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

/// RGBA 相关的 UIColor 获取方法
@interface UIColor (RGBA)

/// 通过 rgba 获取UIColor
/// @param rgba rgba 信息，每 8 位表示一个颜色通道
+ (UIColor *)colorWithRGBA:(uint32_t)rgba;

/// 通过 argb 获取UIColor
/// @param argb argb 信息，每 8 位表示一个颜色通道
+ (UIColor *)colorWithARGB:(uint32_t)argb;

/// 通过 rgb 获取UIColor
/// @param rgb rgb 信息，每 8 位表示一个颜色通道
+ (UIColor *)colorWithRGB:(uint32_t)rgb;

/// 通过 rgb 和 alpha 获取UIColor
/// @param rgb rgb 信息，每 8 位表示一个颜色通道
/// @param alpha alpha 透明度信息
+ (UIColor *)colorWithRGB:(uint32_t)rgb alpha:(CGFloat)alpha;

/// 通过WEB颜色串生成一个UIColor
/// @param hexString WEB颜色串，支持形式有："#rrggbbaa"、"#rrggbb"、"#rgb"、"rrggbbaa"、"rrggbb"、"rgb"
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
