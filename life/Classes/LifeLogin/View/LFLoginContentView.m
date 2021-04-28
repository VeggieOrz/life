//
//  LFLoginContentView.m
//  life
//
//  Created by liuweihong on 2020/12/3.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFLoginContentView.h"
#import "LFTextEditView.h"
#import "UIColor+RGBA.h"
#import "LFUIMacro.h"
#import <Masonry/Masonry.h>

CGFloat const kLFLoginElementHeight = 48.0f;    // 控件的高度
CGFloat const kLFLoginElementLRPadding = 24.0f;  // 控件距离屏幕边框的左右距离
CGFloat const kLFLoginElementTBPadding = 20.0f;  // 控件之间的距离

@interface LFLoginContentView ()

@property (nonatomic, strong) UIView *view; // 承载view
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) LFTextEditView *emailEditView;
@property (nonatomic, strong) LFTextEditView *passwordEditView;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UIButton *forgetBtn;

@end

@implementation LFLoginContentView

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
    [self.passwordEditView dismissKeyBoard];
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
    [self.view addSubview:self.passwordEditView];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registerBtn];
    [self.view addSubview:self.forgetBtn];
    
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
        make.top.mas_equalTo(self.logoImageView.mas_bottom).offset(kLFLoginElementTBPadding * 2);
        make.left.mas_equalTo(self.view.mas_left).offset(kLFLoginElementLRPadding);
        make.right.mas_equalTo(self.view.mas_right).offset(-kLFLoginElementLRPadding);
        make.height.mas_equalTo(kLFLoginElementHeight);
    }];
    
    [self.passwordEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.emailEditView.mas_bottom).offset(kLFLoginElementTBPadding);
        make.left.mas_equalTo(self.view.mas_left).offset(kLFLoginElementLRPadding);
        make.right.mas_equalTo(self.view.mas_right).offset(-kLFLoginElementLRPadding);
        make.height.mas_equalTo(kLFLoginElementHeight);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordEditView.mas_bottom).offset(kLFLoginElementTBPadding);
        make.left.mas_equalTo(self.view.mas_left).offset(kLFLoginElementLRPadding);
        make.right.mas_equalTo(self.view.mas_right).offset(-kLFLoginElementLRPadding);
        make.height.mas_equalTo(kLFLoginElementHeight);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBtn.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left).offset(kLFLoginElementLRPadding);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBtn.mas_bottom);
        make.right.mas_equalTo(self.view.mas_right).offset(-kLFLoginElementLRPadding);
        make.size.mas_equalTo(CGSizeMake(80, 30));
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

- (LFTextEditView *)passwordEditView {
    if (!_passwordEditView) {
        UIImage *image = [UIImage imageNamed:@"login_password"];
        _passwordEditView = [[LFTextEditView alloc] initWithImage:image
                                                      placeholder:@"输入密码"];
        [_passwordEditView setSecureTextEntry:YES];
    }
    return _passwordEditView;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor colorWithRGB:0x515151]];
        _loginBtn.titleLabel.font = [UIFont fontWithName:@"STKaiti" size:16.0f];
        _loginBtn.layer.cornerRadius = kLFLoginElementHeight / 2.0;
        _loginBtn.layer.masksToBounds = YES;
    }
    return _loginBtn;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] init];
        _registerBtn.titleLabel.font = [UIFont fontWithName:@"STKaiti" size:16.0f];
        [_registerBtn setTitleColor:[UIColor colorWithRGB:0x515151] forState:UIControlStateNormal];
        [_registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    }
    return _registerBtn;
}

- (UIButton *)forgetBtn {
    if (!_forgetBtn) {
        _forgetBtn = [[UIButton alloc] init];
        _forgetBtn.titleLabel.font = [UIFont fontWithName:@"STKaiti" size:16.0f];
        [_forgetBtn setTitleColor:[UIColor colorWithRGB:0x515151] forState:UIControlStateNormal];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    }
    return _forgetBtn;
}

@end
