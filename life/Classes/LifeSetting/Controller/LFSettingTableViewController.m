//
//  LFSettingTableViewController.m
//  life
//
//  Created by liuweihong on 2021/4/25.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingTableViewController.h"
#import "LFUIMacro.h"

@interface LFSettingTableViewController ()

@end

@implementation LFSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
}

#pragma mark - Private Method

- (void)configTableView {
    // 创建数据源
    [self createDataSource];
    // 创建 tableView
    [self.view addSubview:self.tableView];
}

#pragma mark - LFSettingTableViewControllerDelegate

- (void)createDataSource {
    // 子类重写
}

#pragma mark - Getter Method

- (LFSettingTableView *)tableView {
    if (!_tableView) {
        _tableView = [[LFSettingTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)  style:UITableViewStyleGrouped];
        _tableView.lfDelegate = self;
        _tableView.lfDataSource = self.dataSource;
    }
    return _tableView;
}

@end
