//
//  NSDate+Easy.m
//  life
//
//  Created by liuweihong on 2021/2/18.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "NSDate+Easy.h"

static const NSCalendarUnit unitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (Easy)

#pragma mark - Singleton
+ (NSCalendar *)calendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        // 创建日历对象，指定日历的算法（公历）
        sharedCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return sharedCalendar;
}

#pragma mark - Getter Method
- (NSInteger)lf_year {
    // NSDateComponent 可以获得日期的详细信息，即日期的组成
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.year;
}

- (NSInteger)lf_month {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.month;
}

- (NSInteger)lf_day {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.day;
}

- (NSInteger)lf_hour {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.hour;
}

- (NSInteger)lf_minute {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.minute;
}

- (NSInteger)lf_second {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.second;
}

- (NSInteger)lf_weekday {
    NSDateComponents *components = [[NSDate calendar] components:unitFlags fromDate:self];
    return components.weekday;
}

- (NSString *)lf_weekdayString {
    switch (self.lf_weekday - 1) {
        case 0:
        {
            return @"周日";
        }
            break;
        case 1:
        {
            return @"周一";
        }
            break;
        case 2:
        {
            return @"周二";
        }
            break;
        case 3:
        {
            return @"周三";
        }
            break;
        case 4:
        {
            return @"周四";
        }
            break;
        case 5:
        {
            return @"周五";
        }
            break;
        case 6:
        {
            return @"周六";
        }
            break;
            
        default:
            break;
    }
    
    return @"";
}

- (NSString *)lf_weekdayString_CN {
    NSArray *weeks = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    return weeks[self.lf_weekday - 1];
}


- (NSString *)lf_yearString_CN {
    NSInteger year = self.lf_year;
    NSArray *nums = @[@"零", @"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八",@"九"];
    NSMutableString *mutableString = [NSMutableString string];
    for (int i = 1000; i >= 1; i /= 10) {
        NSInteger index = year / i;
        year %= i;
        [mutableString appendString:nums[index]];
    }
    [mutableString appendString:@"年"];
    return [mutableString copy];
}

- (NSString *)lf_monthStr_CN {
    NSArray *months = @[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"];
    return months[self.lf_month - 1];
}

- (NSString *)lf_monthStr_EN {
    NSArray *months = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sept", @"Oct", @"Nov", @"Dec"];
    return months[self.lf_month - 1];
}

@end
