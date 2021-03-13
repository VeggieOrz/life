//
//  LFGlobalConfig.h
//  life
//
//  Created by liuweihong on 2021/3/13.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFGlobalConfig : NSObject

@property (nonatomic, copy) NSString *fontName;

/// 获取单例对象
+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
