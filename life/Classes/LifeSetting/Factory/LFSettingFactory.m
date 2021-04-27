//
//  LFSettingFactory.m
//  life
//
//  Created by liuweihong on 2021/4/24.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingFactory.h"
#import "LFSettingItem.h"
#import "LFSettingSectionModel.h"


@implementation LFSettingFactory

/*
 （1）    账号安全：用户通过注册时的绑定邮箱进行身份验证后，可以对绑定邮箱进行修改，也可以对登陆密码进行修改。
 （2）    日常记事提醒：用户可以通过开关设置日常记事提醒，如果用户没有授予通知权限，则提醒用户先到设置用进行权限设置。
 （3）    清除缓存：用户通过点击清楚日记在本地的缓存。
 （4）    意见反馈：用户可以通过输入文字内容进行与Life相关的意见反馈。
 （5）    关于Life：用户可以看到关于Life的Logo以及应用版本信息。
 （6）    退出登录：注销当前用户的登陆状态，并退出到注册登陆页。
 */

+ (NSArray *)settingPageData {
    // section0
    LFSettingItem *item0 = [LFSettingItem new];
    item0.cellType = LFSettingCellTypeRightArrow;
    item0.identifier = 0;
    item0.title = @"账号安全";
    
    LFSettingItem *item1 = [LFSettingItem new];
    item1.cellType = LFSettingCellTypeRightArrow;
    item1.identifier = 1;
    item1.title = @"日常记事提醒";
    
    LFSettingItem *item2 = [LFSettingItem new];
    item2.cellType = LFSettingCellTypeRightArrow;
    item2.identifier = 2;
    item2.title = @"清除缓存";
    
    LFSettingSectionModel *section0 = [[LFSettingSectionModel alloc] initWithItemsArray:@[item0, item1, item2]];
    
    // section1
    LFSettingItem *item3 = [LFSettingItem new];
    item3.cellType = LFSettingCellTypeRightArrow;
    item3.identifier = 3;
    item3.title = @"意见反馈";
    
    LFSettingItem *item4 = [LFSettingItem new];
    item4.cellType = LFSettingCellTypeRightArrow;
    item4.identifier = 4;
    item4.title = @"关于Life";
    
    LFSettingSectionModel *section1 = [[LFSettingSectionModel alloc] initWithItemsArray:@[item3, item4]];
    
    // section2
    LFSettingItem *logoutItem = [LFSettingItem new];
    logoutItem.cellType = LFSettingCellTypeLogout;
    logoutItem.identifier = 5;
    logoutItem.centerTitle = @"退出登录";

    
    LFSettingSectionModel *section2 = [[LFSettingSectionModel alloc] initWithItemsArray:@[logoutItem]];
    
    return @[section0, section1, section2];
}

@end
