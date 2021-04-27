//
//  LFSettingItem.m
//  life
//
//  Created by liuweihong on 2021/4/21.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingItem.h"

const CGFloat kSettingCellDefautHeight = 50.0f;

@implementation LFSettingItem

- (instancetype)init {
    if (self = [super init]) {
        _cellID = @"kLFSettingItemCell";
        _cellHeight = kSettingCellDefautHeight;
    }
    return self;
}

@end
