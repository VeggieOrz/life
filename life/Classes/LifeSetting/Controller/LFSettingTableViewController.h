//
//  LFSettingTableViewController.h
//  life
//
//  Created by liuweihong on 2021/4/25.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFSettingTableView.h"


@protocol LFSettingTableViewControllerDelegate <NSObject>

@required
- (void)createDataSource;

@end

NS_ASSUME_NONNULL_BEGIN

/// 设置页的基类，支持 TableView 的 section 切圆角
@interface LFSettingTableViewController : UIViewController <LFSettingTableViewControllerDelegate, LFSettingTableViewDelegate>

@property (nonatomic, readwrite, strong) LFSettingTableView *tableView;
@property (nonatomic, readwrite, strong) LFSettingTableViewDataSource *dataSource;

@end

NS_ASSUME_NONNULL_END
