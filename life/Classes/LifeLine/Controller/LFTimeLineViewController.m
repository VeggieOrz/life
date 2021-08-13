//
//  LFTimeLineViewController.m
//  life
//
//  Created by liuweihong on 2021/2/14.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFTimeLineViewController.h"
#import "LFTimeLineTableViewCell.h"
#import "LFEventDetailViewController.h"
#import "LFEventModel.h"
#import "UIColor+RGBA.h"

const CGFloat kTimeLineCellHeight = 105;

@interface LFTimeLineViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LFTimeLineViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupSubViews];
    [self.tableView registerClass:[LFTimeLineTableViewCell class] forCellReuseIdentifier:@"LFTimeLineTableViewCell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFEventModel *eventModel = [LFEventModel new];
    LFTimeLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LFTimeLineTableViewCell"];
    if (cell == nil) {
        cell = [[LFTimeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LFTimeLineTableViewCell"];
    }
    [cell configWithModel:eventModel];
    return cell;
}

#pragma mark - UITabBarDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LFEventModel *eventModel = [LFEventModel new];
    eventModel.eventDate = [NSDate date];
    
    LFEventDetailViewController *eventDetailVC = [LFEventDetailViewController new];
    eventDetailVC.eventModel = eventModel;
    [self.navigationController pushViewController:eventDetailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTimeLineCellHeight;
}

- ( UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 删除
    UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"移除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        completionHandler (YES);
        [self.tableView reloadData];
    }];
    
    deleteRowAction.backgroundColor = [UIColor colorWithRGB:0xfe6666];
    
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction]];
    return config;
}

#pragma mark - Action Method

- (void)didTapSearchButton:(id)sender {
    
}

- (void)didTapAddButton:(id)sender {
    
}

#pragma mark - UIAbout

- (void)setupNavigationBar {
    // 设置左边的搜索
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 26);
    UIImage *backImage = [UIImage imageNamed:@"timeline_sousuo"];
    [searchButton setImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(didTapSearchButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 设置右边的添加按钮
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    addButton.imageEdgeInsets = UIEdgeInsetsMake(10, 26, 10, 0);
    UIImage *image = [UIImage imageNamed:@"timeline_tianjia"];
    [addButton setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(didTapAddButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setupSubViews {
    [self.view addSubview:self.tableView];
}

- (void)setupLayoutConstraint {
    
}


#pragma mark - Getter Method

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor =  [UIColor colorWithRGB:0xf5f6f7];
        // 不显示分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置数据源和代理
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
