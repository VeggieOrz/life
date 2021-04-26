//
//  LFSettingSectionModel.m
//  life
//
//  Created by liuweihong on 2021/4/21.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingSectionModel.h"

@implementation LFSettingSectionModel

- (instancetype)initWithItemsArray:(NSArray *)itemsArray {
    if (self = [super init]) {
        _itemsArray = [itemsArray copy];
    }
    return self;
}

@end
