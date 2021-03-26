//
//  LFUserProfileViewController.m
//  life
//
//  Created by liuweihong on 2021/3/26.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFUserProfileViewController.h"
#import "LFSettingViewController.h"
#import "UIImage+Color.h"

@interface LFUserProfileViewController ()

@end

@implementation LFUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupSubViews];
    [self setupLayoutConstraint];
}

#pragma mark - Action Method

- (void)didTapEditButton:(id)sender {
    LFSettingViewController *settingVC = [LFSettingViewController new];
    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark - Navigation

- (void)setupNavigationBar {
    // 设置导航栏颜色
    UIImage *backgroundImage = [UIImage lf_imageWithColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    // 设置右边按钮
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    settingButton.imageEdgeInsets = UIEdgeInsetsMake(8, 22, 8, 0);
    UIImage *image = [UIImage imageNamed:@"profile_setting"];
    [settingButton setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(didTapEditButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

#pragma mark - UI About

- (void)setupSubViews {
    
}

- (void)setupLayoutConstraint {
    
}

@end
