//
//  LFTabBarController.m
//  life
//
//  Created by liuweihong on 2021/3/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFTabBarController.h"
#import "LFHomeViewController.h"
#import "LFTimeLineViewController.h"
#import "LFSettingViewController.h"

@interface LFTabBarController ()

@end

@implementation LFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LFHomeViewController *homeVC = [[LFHomeViewController alloc] init];
    UINavigationController *homeNavVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNavVC.tabBarItem.title = @"主页";
    
    LFTimeLineViewController *timeLineVC = [[LFTimeLineViewController alloc] init];
    UINavigationController *timeLiveNavVC = [[UINavigationController alloc] initWithRootViewController:timeLineVC];
    timeLiveNavVC.tabBarItem.title = @"时间轴";
    
    LFSettingViewController *settingVC = [[LFSettingViewController alloc] init];
    UINavigationController *settingNavVC = [[UINavigationController alloc] initWithRootViewController:settingVC];
    settingNavVC.tabBarItem.title = @"设置";
    
    self.viewControllers = @[homeNavVC, timeLiveNavVC, settingNavVC];
    
}

@end
