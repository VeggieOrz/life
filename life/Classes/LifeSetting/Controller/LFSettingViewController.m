//
//  LFSettingViewController.m
//  life
//
//  Created by liuweihong on 2021/2/27.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingViewController.h"
#import "LFWeatherSelectorView.h"

@interface LFSettingViewController ()

@end

@implementation LFSettingViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [LFWeatherSelectorView showWithInitIdex:1 block:^(NSInteger index) {
        NSLog(@"[LFWeatherSelectorView] %d", (int)index);
    }];
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
