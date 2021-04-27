//
//  LFUserProfileViewController.m
//  life
//
//  Created by liuweihong on 2021/3/26.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFUserProfileViewController.h"
#import "LFSettingViewController.h"
#import "LFProfileHeaderView.h"
#import "LFProfileDataShowView.h"
#import "UIImage+Color.h"
#import "UIColor+RGBA.h"
#import "LFUIMacro.h"
#import <Masonry/Masonry.h>


@interface LFUserProfileViewController ()

@property (nonatomic, strong) LFProfileHeaderView *headerView;

@property (nonatomic, strong) LFProfileDataShowView *datashowView1;
@property (nonatomic, strong) LFProfileDataShowView *datashowView2;

@end

@implementation LFUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xf5f6f7];
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
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.datashowView1];
    [self.view addSubview:self.datashowView2];
}

- (void)setupLayoutConstraint {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth - 32));
        make.height.equalTo(@100);
        make.top.left.equalTo(self.view).offset(16);
    }];
    
    [self.datashowView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.datashowView2);
        make.height.equalTo(@80);
        make.top.equalTo(self.headerView.mas_bottom).offset(16);
        make.left.equalTo(self.view).offset(16);
    }];
    
    [self.datashowView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.datashowView1);
        make.height.equalTo(@80);
        make.top.equalTo(self.datashowView1);
        make.left.equalTo(self.datashowView1.mas_right).offset(16);
        make.right.equalTo(self.view).offset(-16);
    }];
}

#pragma mark - Getter Method

- (LFProfileHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [LFProfileHeaderView new];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (LFProfileDataShowView *)datashowView1 {
    if (!_datashowView1) {
        _datashowView1 = [LFProfileDataShowView new];
        _datashowView1.backgroundColor = [UIColor whiteColor];
    }
    return _datashowView1;
}

- (LFProfileDataShowView *)datashowView2 {
    if (!_datashowView2) {
        _datashowView2 = [LFProfileDataShowView new];
        _datashowView2.backgroundColor = [UIColor whiteColor];
    }
    return _datashowView2;
}

@end
