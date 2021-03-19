//
//  LFRegisterContentView.h
//  life
//
//  Created by liuweihong on 2020/12/4.
//  Copyright © 2020 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFRegisterContentView : UIView

@property (nonatomic, readonly) UIButton *registerBtn;
@property (nonatomic, readonly) UIButton *closeBtn;

/// 收起键盘
- (void)dismissKeyBoard;

@end

NS_ASSUME_NONNULL_END
