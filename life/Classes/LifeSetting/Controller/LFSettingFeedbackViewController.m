//
//  LFSettingFeedbackViewController.m
//  life
//
//  Created by liuweihong on 2021/4/26.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingFeedbackViewController.h"
#import "UIColor+RGBA.h"

@interface LFSettingFeedbackViewController ()

@end

@implementation LFSettingFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavigationBar];
}

#pragma mark -

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
    UILabel *label = [UILabel new];
    label.textColor = [UIColor colorWithRGB:0x44444];
    label.font = [UIFont fontWithName:@"STKaiti" size:18.0f];
    label.text = @"意见反馈";
    self.navigationItem.titleView = label;
}

@end
