//
//  LFSettingItem.h
//  life
//
//  Created by liuweihong on 2021/4/21.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

/// SettingItemCell 的风格
typedef NS_ENUM(NSInteger, LFSettingCellType) {
    LFSettingCellTypeNone,              //右侧没有任何控件
    LFSettingCellTypeRightArrow,        //右侧是箭头
    LFSettingCellTypeSwitch,            //右侧是开关
    LFSettingCellTypeLogout             //退出登录cell
};

NS_ASSUME_NONNULL_BEGIN

@interface LFSettingItem : NSObject

@property (nonatomic, assign) LFSettingCellType cellType;

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy) NSString *cellID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *centerTitle;
@property (nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
