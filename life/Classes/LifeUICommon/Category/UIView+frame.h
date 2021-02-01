//
//  UIView+frame.h
//  life
//
//  Created by liuweihong on 2021/1/31.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 快速获取UIView的bounds信息
/// @note 使用 setter 方法会使View原本的 frame 指针失效
@interface UIView (frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@end

NS_ASSUME_NONNULL_END
