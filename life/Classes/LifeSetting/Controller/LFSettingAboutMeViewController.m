//
//  LFSettingAboutMeViewController.m
//  life
//
//  Created by liuweihong on 2021/4/26.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingAboutMeViewController.h"
#import "UIColor+RGBA.h"
#import "LFInfoMacro.h"
#import <Masonry/Masonry.h>

@interface LFSettingAboutMeViewController ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *versionLabel;
@property (nonatomic, strong) UIView *verticalLine;
@property (nonatomic, strong) UIButton *userAgreeMentBtn;
@property (nonatomic, strong) UIButton *privayAgreeMentBtn;

@end

@implementation LFSettingAboutMeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UI About

- (void)setupSubViews {
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.titleLable];
    [self.view addSubview:self.versionLabel];
    [self.view addSubview:self.verticalLine];
    [self.view addSubview:self.userAgreeMentBtn];
    [self.view addSubview:self.privayAgreeMentBtn];
}

- (void)setupLayoutConstrain {
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(60);
        make.width.height.equalTo(@200);
    }];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.userAgreeMentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.privayAgreeMentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

#pragma mark - Getter Method

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        UIImage *image = [UIImage imageNamed:@"AppIcon"];
        _logoImageView = [[UIImageView alloc] initWithImage:image];
    }
    return _logoImageView;
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.font = [UIFont fontWithName:@"Papyrus" size:24.0f];
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    }
    return _titleLable;
}

- (UILabel *)versionLabel {
    if (!_versionLabel) {
        _versionLabel = [UILabel new];
        _versionLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        _versionLabel.textColor = [UIColor colorWithRGB:0x444444];
        _versionLabel.text = @"";
    }
    return _versionLabel;
}

- (UIView *)verticalLine {
    if (!_verticalLine) {
        _verticalLine = [UIView new];
    }
    return _verticalLine;
}

- (UIButton *)userAgreeMentBtn {
    if (!_userAgreeMentBtn) {
        _userAgreeMentBtn = [UIButton new];
        [_userAgreeMentBtn setTitle:@"用户协议" forState:UIControlStateNormal];
    }
    return _userAgreeMentBtn;
}

- (UIButton *)privayAgreeMentBtn {
    if (!_privayAgreeMentBtn) {
        _privayAgreeMentBtn = [UIButton new];
        [_privayAgreeMentBtn setTitle:@"隐私协议" forState:UIControlStateNormal];
    }
    return _privayAgreeMentBtn;
}

@end
