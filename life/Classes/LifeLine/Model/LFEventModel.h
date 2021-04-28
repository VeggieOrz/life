//
//  LFEventModel.h
//  life
//
//  Created by liuweihong on 2021/3/22.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 生活事件
@interface LFEventModel : NSObject

@property (nonatomic, copy) NSString *eventID;
@property (nonatomic, copy) NSString *eventTitle;
@property (nonatomic, copy) NSString *eventDetail;
@property (nonatomic, strong) NSDate *eventDate;

@end

NS_ASSUME_NONNULL_END
