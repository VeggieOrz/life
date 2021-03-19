//
//  LFTextEditView.h
//  life
//
//  Created by liuweihong on 2020/12/3.
//  Copyright © 2020 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 左侧带图标的输入框
@interface LFTextEditView : UIView
//
@property (nonatomic, readonly) UITextField *inputField;

/// 初始化方法
/// @param image 左侧图标
/// @param placeholder 输入框占位字符
- (instancetype)initWithImage:(UIImage *)image
                  placeholder:(NSString *)placeholder;


/// 设置输入框是否为密码形式，默认为 NO
/// @param secureTextEntry YES 表示为输入框为密码形式
- (void)setSecureTextEntry:(BOOL)secureTextEntry;

/// 收起键盘
- (void)dismissKeyBoard;

@end

NS_ASSUME_NONNULL_END
