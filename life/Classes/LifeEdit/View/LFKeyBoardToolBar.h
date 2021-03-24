//
//  LFKeyBoardToolBar.h
//  life
//
//  Created by liuweihong on 2021/3/17.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LFKeyBoardToolBar;

@protocol LFKeyBoardToolBarDelegate <NSObject>

@required
- (void)didTapUpButton:(LFKeyBoardToolBar *)toolBar;
- (void)didTapDownButton:(LFKeyBoardToolBar *)toolBar;
- (void)didTapDoneButton:(LFKeyBoardToolBar *)toolBar;

@end

@interface LFKeyBoardToolBar : UIView

@property (nonatomic, weak) id<LFKeyBoardToolBarDelegate> delegate;

/// 设置按钮状态和标题展示
/// @param isUp YES 表示第一响应器是标题输入框，NO 表示为内容输入框
- (void)setViewsWithStatus:(BOOL)isUp;

@end

NS_ASSUME_NONNULL_END
