//
//  LFGlobalConfig.m
//  life
//
//  Created by liuweihong on 2021/3/13.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFGlobalConfig.h"

@implementation LFGlobalConfig

+ (instancetype)sharedInstance {
    static LFGlobalConfig *instance;
    dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [LFGlobalConfig new];
    });
    return instance;
}

@end
