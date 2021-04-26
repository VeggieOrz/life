//
//  LFSettingViewController.m
//  life
//
//  Created by liuweihong on 2021/2/27.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingViewController.h"
#import "LFSettingAboutMeViewController.h"
#import "LFSettingFeedbackViewController.h"
#import "LFSettingFactory.h"
#import "LFSettingItem.h"
#import "UIColor+RGBA.h"

@interface LFSettingViewController ()

@end

@implementation LFSettingViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

#pragma mark - Override Method

- (void)createDataSource {
    NSArray *sectionsArr = [LFSettingFactory settingPageData];
    LFSettingTableViewDataSource *dataSource = [[LFSettingTableViewDataSource alloc] initWithViewModelsArray:sectionsArr];
    self.dataSource = dataSource;
}

- (void)didSelectItem:(LFSettingItem *)item atIndexPath:(NSIndexPath *)indexPath {
    switch (item.identifier) {
        case 0: {
            NSLog(@"账号安全");
        } break;
            
        case 1: {
            
            NSLog(@"日常记事提醒");
        } break;
            
        case 2: {
            NSLog(@"清除缓存");
        } break;
            
        case 3: {
            LFSettingFeedbackViewController *feedbackVC = [LFSettingFeedbackViewController new];
            [self.navigationController pushViewController:feedbackVC animated:YES];
            NSLog(@"意见反馈");
        } break;
            
        case 4: {
            NSLog(@"关于Life");
            LFSettingAboutMeViewController *aboutMeVC = [LFSettingAboutMeViewController new];
            [self.navigationController pushViewController:aboutMeVC animated:YES];
        } break;
            
        case 5: {
            NSLog(@"退出登录");
        } break;
    }
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
    UILabel *label = [UILabel new];
    label.textColor = [UIColor colorWithRGB:0x44444];
    label.font = [UIFont fontWithName:@"STKaiti" size:18.0f];
    label.text = @"设置";
    self.navigationItem.titleView = label;
}

@end
