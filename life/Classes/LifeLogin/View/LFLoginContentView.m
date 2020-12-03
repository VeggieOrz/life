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
#import <Masonry/Masonry.h>

CGFloat const kLFLoginElementHeight = 48.0f;    // 控件的高度
CGFloat const kLFLoginElementLRPadding = 24.0f;  // 控件距离屏幕边框的左右距离
CGFloat const kLFLoginElementTDPadding = 20.0f;  // 控件之间的距离

@interface LFLoginContentView ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) LFTextEditView *emailEditView;
@property (nonatomic, strong) LFTextEditView *passwordEditView;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UIButton *forgetBtn;

@end

@implementation LFLoginContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.loginBtn];
    [self addSubview:self.registerBtn];
    [self addSubview:self.forgetBtn];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.mas_left).offset(kLFLoginElementLRPadding);
        make.right.mas_equalTo(self.mas_right).offset(-kLFLoginElementLRPadding);
        make.height.mas_equalTo(kLFLoginElementHeight);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBtn.mas_bottom);
        make.left.mas_equalTo(self.mas_left).offset(kLFLoginElementLRPadding);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBtn.mas_bottom);
        make.right.mas_equalTo(self.mas_right).offset(-kLFLoginElementLRPadding);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
}

#pragma mark - Getter

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        UIImage *logoImage = [UIImage imageNamed:@""];
        _logoImageView = [[UIImageView alloc] initWithImage:logoImage];
    }
    return _logoImageView;
}

- (LFTextEditView *)emailEditView {
    if (!_emailEditView) {
        
    }
    return _emailEditView;
}

- (LFTextEditView *)passwordEditView {
    if (!_passwordEditView) {
        
    }
    return _passwordEditView;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor colorWithRGB:0x515151]];
        _loginBtn.layer.cornerRadius = kLFLoginElementHeight / 2.0;
        _loginBtn.layer.masksToBounds = YES;
    }
    return _loginBtn;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] init];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_registerBtn setTitleColor:[UIColor colorWithRGB:0x515151] forState:UIControlStateNormal];
        [_registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    }
    return _registerBtn;
}

- (UIButton *)forgetBtn {
    if (!_forgetBtn) {
        _forgetBtn = [[UIButton alloc] init];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_forgetBtn setTitleColor:[UIColor colorWithRGB:0x515151] forState:UIControlStateNormal];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    }
    return _forgetBtn;
}

@end
