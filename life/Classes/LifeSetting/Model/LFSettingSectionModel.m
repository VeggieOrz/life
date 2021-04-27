//
//  LFSettingSectionModel.m
//  life
//
//  Created by liuweihong on 2021/4/21.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingSectionModel.h"

const CGFloat kDefautSectionHeaderHeight = 10.0f;

@implementation LFSettingSectionModel

- (instancetype)initWithItemsArray:(NSArray *)itemsArray {
    if (self = [super init]) {
        _itemsArray = [itemsArray copy];
        _sectionHeaderHeight = kDefautSectionHeaderHeight;
    }
    return self;
}

@end
