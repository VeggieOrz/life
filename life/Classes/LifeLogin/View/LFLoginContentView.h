//
//  LFLoginContentView.h
//  life
//
//  Created by liuweihong on 2020/12/3.
//  Copyright © 2020 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFLoginContentView : UIView

@property (nonatomic, readonly) UIButton *loginBtn;
@property (nonatomic, readonly) UIButton *registerBtn;
@property (nonatomic, readonly) UIButton *forgetBtn;

/// 收起键盘
- (void)dismissKeyBoard;

@end

NS_ASSUME_NONNULL_END
