//
//  LFSettingTableViewDataSource.m
//  life
//
//  Created by liuweihong on 2021/4/24.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingTableViewDataSource.h"
#import "LFSettingSectionModel.h"
#import "LFSettingItem.h"
#import "LFSettingItemCell.h"

@implementation LFSettingTableViewDataSource

- (instancetype)initWithViewModelsArray:(NSArray *)sectionsArray {
    if (self = [super init]) {
        _sectionsArray = [sectionsArray copy];
    }
    return self;
}

#pragma mark - LFSettingTableViewDataSource

- (LFSettingSectionModel *)tableView:(UITableView *)tableView sectionModelInSection:(NSInteger )section {
    LFSettingSectionModel *sectionModel = self.sectionsArray[section];
    return sectionModel;
}

- (LFSettingItem *)tableView:(UITableView *)tableview itemAtIndexPath:(NSIndexPath *)indexPath {
    LFSettingSectionModel *sectionModel = self.sectionsArray[indexPath.section];
    LFSettingItem *settingItem = sectionModel.itemsArray[indexPath.row];
    return settingItem;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LFSettingSectionModel *sectionModel = [self.sectionsArray objectAtIndex:section];
    return sectionModel.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFSettingSectionModel *sectionModel = self.sectionsArray[indexPath.section];
    LFSettingItem *settingItem = sectionModel.itemsArray[indexPath.row];
    
    LFSettingItemCell *cell = [tableView dequeueReusableCellWithIdentifier:settingItem.cellID];
    if (!cell) {
        cell = [[LFSettingItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:settingItem.cellID];
    }
    
    // 更新 cell 的数据
    [cell configWithItem:settingItem];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    LFSettingSectionModel *sectionModel = self.sectionsArray[section];
    return sectionModel.sectionHeaderTitle;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    LFSettingSectionModel *sectionModel = self.sectionsArray[section];
    return sectionModel.sectionFooterTitle;
}

@end
