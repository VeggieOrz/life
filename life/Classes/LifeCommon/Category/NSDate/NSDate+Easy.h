//
//  NSDate+Easy.h
//  life
//
//  Created by liuweihong on 2021/2/18.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Easy)

/// 获取指定date的详细信息
@property (readonly) NSInteger lf_year;    // 年
@property (readonly) NSInteger lf_month;   // 月
@property (readonly) NSInteger lf_day;     // 日
@property (readonly) NSInteger lf_hour;    // 时
@property (readonly) NSInteger lf_minute;  // 分
@property (readonly) NSInteger lf_second;  // 秒
@property (readonly) NSInteger lf_weekday; // 星期

// 获取中文星期字符串
@property (nullable, nonatomic, readonly, copy) NSString *lf_weekdayString;

@end

NS_ASSUME_NONNULL_END
