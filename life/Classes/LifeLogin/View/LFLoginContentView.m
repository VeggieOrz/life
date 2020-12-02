//
//  LFLoginContentView.m
//  life
//
//  Created by liuweihong on 2020/12/3.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFLoginContentView.h"
#import <Masonry/Masonry.h>

CGFloat const kLFLoginElementHeight = 120.0f;    // 控件的高度
CGFloat const kLFLoginElementLRPadding = 78.0f;  // 控件距离屏幕边框的左右距离
CGFloat const kLFLoginElementTDPadding = 60.0f;  // 控件之间的距离

@interface LFLoginContentView ()


@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UIButton *forgetBtn;

@end

@implementation LFLoginContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.loginBtn];
    [self addSubview:self.registerBtn];
    [self addSubview:self.forgetBtn];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(kLFLoginElementLRPadding);
        make.right.mas_equalTo(self.mas_right).offset(kLFLoginElementLRPadding);
        make.height.mas_equalTo(120.0f);
    }];
    
}

#pragma mark - Getter

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        
    }
    return _loginBtn;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        
    }
    return _registerBtn;
}

- (UIButton *)forgetBtn {
    if (!_forgetBtn) {
        
    }
    return _forgetBtn;
}

@end
