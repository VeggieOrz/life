//
//  LFUIMacro.h
//  life
//
//  Created by liuweihong on 2021/1/31.
//  Copyright © 2021 veggie. All rights reserved.
//

#ifndef LFUIMacro_h
#define LFUIMacro_h

// 刘海屏判断
#define iPhoneX (ABS(MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) / MIN(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) - 896 / 414.0) < 0.01 || ABS(MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) / MIN(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) - 812 / 375.0) < 0.01)

// 屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
// 状态栏高度
#define StatusBar_Height (iPhoneX ? 44.0f : 20.0f)
// 导航栏高度
#define NaviBar_Height (44.0f)
// 状态栏+导航栏高度
#define StatusBar_NaviBar_Height (StatusBar_Height + NaviBar_Height)
// TabBar高度
#define TabBar_Height (iPhoneX ? 49.0f + 34.0f : 49.0f)


#endif /* LFUIMacro_h */
