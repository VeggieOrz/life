//
//  LFEvenModel.h
//  life
//
//  Created by liuweihong on 2021/3/22.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 生活事件
@interface LFEvenModel : NSObject

@property (nonatomic, copy) NSString *evenName;
@property (nonatomic, copy) NSString *evenDetail;
@property (nonatomic, strong) NSDate *evenDate;

@end

NS_ASSUME_NONNULL_END
