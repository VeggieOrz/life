//
//  LFAlertBackgroundView.h
//  life
//
//  Created by liuweihong on 2021/3/5.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 弹窗背景（弹窗类的父类）
@interface LFAlertBackgroundView : UIView

// 点击背景是否消失
@property (nonatomic, assign) BOOL touchRemove;

/// 设置UI布局，初始化时调用（子类重写）
- (void)setupUI;

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
