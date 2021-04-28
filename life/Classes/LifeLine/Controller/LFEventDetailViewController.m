//
//  LFEventDetailViewController.m
//  life
//
//  Created by liuweihong on 2021/4/6.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFEventDetailViewController.h"

@interface LFEventDetailViewController ()

@end

@implementation LFEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavigationBar];
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
}

@end
