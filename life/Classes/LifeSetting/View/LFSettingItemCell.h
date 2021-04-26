//
//  LFSettingItemCell.h
//  life
//
//  Created by liuweihong on 2021/4/21.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFSettingItem;

NS_ASSUME_NONNULL_BEGIN

@interface LFSettingItemCell : UITableViewCell

/// 正常类型
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *rightArrow;

/// 右边开关按钮
@property (nonatomic, strong) UISwitch *switchButton;

/// 退出登录
@property (nonatomic, strong) UIButton *centerButton;;

- (void)configWithItem:(LFSettingItem *)item;

@end

NS_ASSUME_NONNULL_END
