//
//  LFTimeLineViewController.m
//  life
//
//  Created by liuweihong on 2021/2/14.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFTimeLineViewController.h"
#import "LFTimeLineTableViewCell.h"

const CGFloat kTimeLineCellHeight = 105;

@interface LFTimeLineViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LFTimeLineViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    [self.tableView registerClass:[LFTimeLineTableViewCell class] forCellReuseIdentifier:@"LFTimeLineTableViewCell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFTimeLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LFTimeLineTableViewCell"];
    return cell;
}

#pragma mark - UITabBarDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTimeLineCellHeight;
}

#pragma mark - UIAbout

- (void)setupSubViews {
    [self.view addSubview:self.tableView];
}

- (void)setupLayoutConstraint {
    
}


#pragma mark - Getter Method

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor grayColor];
        // 不显示分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置数据源和代理
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
