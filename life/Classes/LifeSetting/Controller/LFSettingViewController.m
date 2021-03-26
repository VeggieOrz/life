//
//  LFSettingViewController.m
//  life
//
//  Created by liuweihong on 2021/2/27.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingViewController.h"
#import "UIColor+RGBA.h"

@interface LFSettingViewController ()

@end

@implementation LFSettingViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavigationBar];
    [self setupSubViews];
    [self setupLayoutConstrain];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Public Method


#pragma mark - Private Method

#pragma mark - Action Method

- (void)didTapBackButton:(id)sender {
    
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
    UILabel *label = [UILabel new];
    label.textColor = [UIColor colorWithRGB:0x44444];
    label.font = [UIFont fontWithName:@"STKaiti" size:18.0f];
    label.text = @"设置";
    self.navigationItem.titleView = label;
}

- (void)setupSubViews {
    
}

- (void)setupLayoutConstrain {
    
}

#pragma mark - Getter Method


@end
