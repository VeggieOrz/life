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
#import "LFUserProfileViewController.h"
#import "LFNavigationController.h"
#import "UIColor+RGBA.h"

@interface LFTabBarController ()

@end

@implementation LFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor whiteColor];
    
    NSArray *configArray = @[
        @{
            @"class":@"LFHomeViewController",
            @"title":@"主页",
            @"image_none_selected":@"tabbar_home",
            @"image_selected":@""
        },
        @{
            @"class":@"LFTimeLineViewController",
            @"title":@"时间轴",
            @"image_none_selected":@"tabbar_time",
            @"image_selected":@""
        },
        @{
            @"class":@"LFUserProfileViewController",
            @"title":@"个人中心",
            @"image_none_selected":@"tabbar_user",
            @"image_selected":@""
        }
    ];
    
    [configArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [NSClassFromString(dict[@"class"]) new];
        LFNavigationController *navVC = [[LFNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = navVC.tabBarItem;
        item.title = dict[@"title"];
        item.image = [UIImage imageNamed:dict[@"image_none_selected"]];
        item.selectedImage = [UIImage imageNamed:dict[@"image_selected"]];
        item.imageInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        
        [item setTitleTextAttributes:@{
            NSForegroundColorAttributeName : [UIColor colorWithRGB:0x444444],
            NSFontAttributeName : [UIFont fontWithName:@"STKaiti" size:12.0f]
        } forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{
            NSForegroundColorAttributeName : [UIColor colorWithRGB:0x5783ae],
            NSFontAttributeName : [UIFont fontWithName:@"STKaiti" size:12.0f]
        } forState:UIControlStateSelected];
        [self addChildViewController:navVC];
    }];
    // 设置 tabar 被选中图标的填充颜色
    [self.tabBar setTintColor:[UIColor colorWithRGB:0x5783ae]];
}

@end
