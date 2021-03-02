//
//  LFWeatherSelectorView.h
//  life
//
//  Created by liuweihong on 2021/3/1.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^LFWeatherSelectorBlock)(void);

/// 天气选择弹窗
@interface LFWeatherSelectorView : UIView
// 当前选择的天气下标
@property (nonatomic, assign) NSInteger currentIndex;
// 点击确定回调
@property (nonatomic, copy) LFWeatherSelectorBlock buttonClickBlock;

// 展示弹窗
- (void)show;
// 移除弹窗
- (void)hide;

@end

NS_ASSUME_NONNULL_END
