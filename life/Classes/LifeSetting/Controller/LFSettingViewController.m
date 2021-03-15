//
//  LFSettingViewController.m
//  life
//
//  Created by liuweihong on 2021/2/27.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingViewController.h"
#import "LFDiaryEditViewController.h"

@interface LFSettingViewController ()

@end

@implementation LFSettingViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    LFDiaryEditViewController *diaryEditVC = [[LFDiaryEditViewController alloc] init];
    [self.navigationController pushViewController:diaryEditVC animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - UI About

- (void)setupSubViews {
    
}

- (void)setupLayoutConstrain {
    
}

#pragma mark - Getter Method


@end
