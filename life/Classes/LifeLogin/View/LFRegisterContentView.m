//
//  LFRegisterContentView.m
//  life
//
//  Created by liuweihong on 2020/12/4.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFRegisterContentView.h"
#import "LFTextEditView.h"
#import "LFUIMacro.h"
#import "UIColor+RGBA.h"
#import <Masonry/Masonry.h>

CGFloat const kLFRegisterElementHeight = 48.0f;    // 控件的高度
CGFloat const kLFRegisterElementLRPadding = 24.0f;  // 控件距离屏幕边框的左右距离
CGFloat const kLFRegisterElementTBPadding = 20.0f;  // 控件之间的距离

@interface LFRegisterContentView ()

@property (nonatomic, strong) UIView *view; // 承载View
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) LFTextEditView *emailEditView;
@property (nonatomic, strong) LFTextEditView *nickNameEditView;
@property (nonatomic, strong) LFTextEditView *passwordEditView;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation LFRegisterContentView

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - Public Method

- (void)dismissKeyBoard {
    [self.emailEditView dismissKeyBoard];
    [self.nickNameEditView dismissKeyBoard];
    [self.passwordEditView dismissKeyBoard];
}

- (NSString *)nickName {
    return self.nickNameEditView.inputField.text;
}

- (NSString *)email {
    return self.emailEditView.inputField.text;
}

- (NSString *)password {
    return self.passwordEditView.inputField.text;
}

#pragma mark - UI About

- (void)setupUI {
    [self addSubview:self.view];
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.emailEditView];
    [self.view addSubview:self.nickNameEditView];
    [self.view addSubview:self.passwordEditView];
    [self.view addSubview:self.registerBtn];
    [self addSubview:self.closeBtn];
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.top.mas_equalTo(self.logoImageView);
        make.bottom.mas_equalTo(self.registerBtn);
    }];
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.size.mas_equalTo(CGSizeMake(200, 118.75));
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    [self.emailEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoImageView.mas_bottom).offset(kLFRegisterElementTBPadding * 2);
        make.left.mas_equalTo(self.view.mas_left).offset(kLFRegisterElementLRPadding);
        make.right.mas_equalTo(self.view.mas_right).offset(-kLFRegisterElementLRPadding);
        make.height.mas_equalTo(kLFRegisterElementHeight);
    }];
    
    [self.nickNameEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.emailEditView.mas_bottom).offset(kLFRegisterElementTBPadding);
        make.left.mas_equalTo(self.view.mas_left).offset(kLFRegisterElementLRPadding);
        make.right.mas_equalTo(self.view.mas_right).offset(-kLFRegisterElementLRPadding);
        make.height.mas_equalTo(kLFRegisterElementHeight);
    }];
    
    [self.passwordEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nickNameEditView.mas_bottom).offset(kLFRegisterElementTBPadding);
        make.left.mas_equalTo(self.view.mas_left).offset(kLFRegisterElementLRPadding);
        make.right.mas_equalTo(self.view.mas_right).offset(-kLFRegisterElementLRPadding);
        make.height.mas_equalTo(kLFRegisterElementHeight);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordEditView.mas_bottom).offset(kLFRegisterElementTBPadding);
        make.left.mas_equalTo(self.view.mas_left).offset(kLFRegisterElementLRPadding);
        make.right.mas_equalTo(self.view.mas_right).offset(-kLFRegisterElementLRPadding);
        make.height.mas_equalTo(kLFRegisterElementHeight);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(StatusBar_Height);
        make.right.equalTo(self.mas_right).offset(-16);
        make.width.height.equalTo(@24);
    }];
}

#pragma mark - Getter

- (UIView *)view {
    if (!_view) {
        _view = [UIView new];
        _view.backgroundColor = [UIColor clearColor];
    }
    return _view;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        UIImage *logoImage = [UIImage imageNamed:@"life_logo"];
        _logoImageView = [[UIImageView alloc] initWithImage:logoImage];
    }
    return _logoImageView;
}

- (LFTextEditView *)emailEditView {
    if (!_emailEditView) {
        UIImage *image = [UIImage imageNamed:@"login_email"];
        _emailEditView = [[LFTextEditView alloc] initWithImage:image
                                                   placeholder:@"输入邮箱"];
    }
    return _emailEditView;
}

- (LFTextEditView *)nickNameEditView {
    if (!_nickNameEditView) {
        UIImage *image = [UIImage imageNamed:@"login_nickname"];
        _nickNameEditView = [[LFTextEditView alloc] initWithImage:image
                                                   placeholder:@"输入昵称"];
    }
    return _nickNameEditView;
}

- (LFTextEditView *)passwordEditView {
    if (!_passwordEditView) {
        UIImage *image = [UIImage imageNamed:@"login_password"];
        _passwordEditView = [[LFTextEditView alloc] initWithImage:image
                                                      placeholder:@"输入密码"];
        [_passwordEditView setSecureTextEntry:YES];
    }
    return _passwordEditView;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.titleLabel.font = [UIFont fontWithName:@"STKaiti" size:16.0f];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:[UIColor colorWithRGB:0x515151]];
        _registerBtn.layer.cornerRadius = kLFRegisterElementHeight / 2.0;
        _registerBtn.layer.masksToBounds = YES;
    }
    return _registerBtn;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        UIImage *image = [UIImage imageNamed:@"login_close"];
        [_closeBtn setBackgroundImage:image forState:UIControlStateNormal];
    }
    return _closeBtn;
}

@end
