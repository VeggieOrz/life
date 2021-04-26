//
//  LFSettingAboutMeViewController.m
//  life
//
//  Created by liuweihong on 2021/4/26.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingAboutMeViewController.h"
#import "LFNavigationController.h"
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavigationBar];
    [self setupSubViews];
    [self setupLayoutConstraint];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [(LFNavigationController *)self.navigationController setShadowImageHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [(LFNavigationController *)self.navigationController setShadowImageHidden:NO];
}

#pragma mark - Action Method

- (void)didTapBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UI About

- (void)setupNavigationBar {
    // 设置左边的返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(11, 0, 11, 28);
    UIImage *backImage = [UIImage imageNamed:@"home_fanhui"];
    [backButton setImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(didTapBackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 设置中间文字
//    UILabel *label = [UILabel new];
//    label.textColor = [UIColor colorWithRGB:0x44444];
//    label.font = [UIFont fontWithName:@"STKaiti" size:18.0f];
//    label.text = @"设置";
//    self.navigationItem.titleView = label;
}

- (void)setupSubViews {
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.titleLable];
    [self.view addSubview:self.versionLabel];
    [self.view addSubview:self.verticalLine];
    [self.view addSubview:self.userAgreeMentBtn];
    [self.view addSubview:self.privayAgreeMentBtn];
}

- (void)setupLayoutConstraint {
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(60);
        make.width.height.equalTo(@100);
    }];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.logoImageView.mas_bottom).offset(36);
    }];
    
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.titleLable.mas_bottom);
    }];
    
    [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.width.equalTo(@0.5);
        make.height.equalTo(@12);
    }];
    
    [self.userAgreeMentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.verticalLine);
        make.right.equalTo(self.verticalLine.mas_left).offset(-10);
        make.width.equalTo(@60);
        make.height.equalTo(@16);
    }];
    
    [self.privayAgreeMentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.verticalLine);
        make.left.equalTo(self.verticalLine.mas_right).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@16);
    }];
}

#pragma mark - Getter Method

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        UIImage *image = [UIImage imageNamed:@"setting_lifeicon"];
        _logoImageView = [[UIImageView alloc] initWithImage:image];
        _logoImageView.layer.borderWidth = 0.5f;
        _logoImageView.layer.borderColor = [UIColor colorWithWhite:0x000000 alpha:0.2].CGColor;
        _logoImageView.layer.cornerRadius = 12.0f;
    }
    return _logoImageView;
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.font = [UIFont fontWithName:@"Papyrus" size:24.0f];
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.text = APP_NAME;
    }
    return _titleLable;
}

- (UILabel *)versionLabel {
    if (!_versionLabel) {
        _versionLabel = [UILabel new];
        _versionLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        _versionLabel.textColor = [UIColor colorWithRGB:0x444444];
        _versionLabel.text = [NSString stringWithFormat:@"Version: %@", APP_VERSION];
    }
    return _versionLabel;
}

- (UIView *)verticalLine {
    if (!_verticalLine) {
        _verticalLine = [UIView new];
        _verticalLine.backgroundColor = [UIColor colorWithRGB:0x444444];
    }
    return _verticalLine;
}

- (UIButton *)userAgreeMentBtn {
    if (!_userAgreeMentBtn) {
        _userAgreeMentBtn = [UIButton new];
        _userAgreeMentBtn.titleLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        [_userAgreeMentBtn setTitleColor:[UIColor colorWithRGB:0x5783ae] forState:UIControlStateNormal];
        [_userAgreeMentBtn setTitle:@"用户协议" forState:UIControlStateNormal];
    }
    return _userAgreeMentBtn;
}

- (UIButton *)privayAgreeMentBtn {
    if (!_privayAgreeMentBtn) {
        _privayAgreeMentBtn = [UIButton new];
        _privayAgreeMentBtn.titleLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        [_privayAgreeMentBtn setTitleColor:[UIColor colorWithRGB:0x5783ae] forState:UIControlStateNormal];
        [_privayAgreeMentBtn setTitle:@"隐私协议" forState:UIControlStateNormal];
    }
    return _privayAgreeMentBtn;
}

@end
