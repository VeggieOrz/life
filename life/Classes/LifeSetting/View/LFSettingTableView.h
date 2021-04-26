//
//  LFSettingTableView.h
//  life
//
//  Created by liuweihong on 2021/4/21.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFSettingTableViewDataSource.h"

@class LFSettingSectionModel;

NS_ASSUME_NONNULL_BEGIN

@protocol LFSettingTableViewDelegate <UITableViewDelegate>

@optional
- (void)didSelectItem:(LFSettingItem *)item atIndexPath:(NSIndexPath *)indexPath;

@end


@interface LFSettingTableView : UITableView <UITableViewDelegate>

@property (nonatomic, weak) id <LFSettingTableViewDelegate> lfDelegate;
@property (nonatomic, weak) id <LFSettingTableViewDataSource> lfDataSource;

@end

NS_ASSUME_NONNULL_END
