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

@end

NS_ASSUME_NONNULL_END
