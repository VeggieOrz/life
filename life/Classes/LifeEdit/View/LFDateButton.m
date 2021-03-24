//
//  LFDateButton.m
//  life
//
//  Created by liuweihong on 2021/3/1.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDateButton.h"
#import "NSDate+Easy.h"
#import "UIColor+RGBA.h"

@interface LFDateButton ()

@end

@implementation LFDateButton

- (instancetype)initWithDate:(NSDate *)date {
    if (self = [super init]) {
        self.date = date;
        self.layer.borderColor = [UIColor colorWithRGB:0x5783ae].CGColor;
        self.titleLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        self.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
        [self setTitleColor:[UIColor colorWithRGB:0x5783ae] forState:UIControlStateNormal];
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 6.0f;
    }
    return self;
}

#pragma mark - Private Method

- (NSString *)_stringWithDate:(NSDate *)date {
    return [NSString stringWithFormat:@"%d/%d/%d %@", (int)date.lf_year, (int)date.lf_month, (int)date.lf_day, date.lf_weekdayString];
}

#pragma mark - Setter Method

- (void)setDate:(NSDate *)date {
    _date = date;
    [self setTitle:[self _stringWithDate:date] forState:UIControlStateNormal];
}

@end
