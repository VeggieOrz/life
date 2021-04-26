//
//  LFSettingTableViewDataSource.h
//  life
//
//  Created by liuweihong on 2021/4/24.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFSettingItem;
@class LFSettingSectionModel;
@class LFSettingTableView;

NS_ASSUME_NONNULL_BEGIN

@protocol LFSettingTableViewDataSource <UITableViewDataSource>

@optional
- (LFSettingSectionModel *)tableView:(UITableView *)tableView sectionModelInSection:(NSInteger )section;
- (LFSettingItem *)tableView:(UITableView *)tableview itemAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface LFSettingTableViewDataSource : NSObject <LFSettingTableViewDataSource>

@property (nonatomic, copy) NSArray *sectionsArray;

- (instancetype)initWithViewModelsArray:(NSArray *)sectionsArray;

@end

NS_ASSUME_NONNULL_END
