//
//  LFDiaryDetailHeaderView.m
//  life
//
//  Created by liuweihong on 2021/3/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryDetailHeaderView.h"
#import "NSDate+Easy.h"
#import <Masonry/Masonry.h>

@interface LFDiaryDetailHeaderView ()

@property (nonatomic, strong) UILabel *dayLabel;   // 日
@property (nonatomic, strong) UILabel *monthLabel; // 月
@property (nonatomic, strong) UILabel *yearLabel;  // 年
@property (nonatomic, strong) UIView *verticalLine1;
@property (nonatomic, strong) UIView *verticalLine2;
@property (nonatomic, strong) UIImageView *weatherImageView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *timeLabel;  // 时间
@property (nonatomic, strong) UILabel *weekLabel;  // 星期
@property (nonatomic, strong) UIView *verticalLine3;

@end

@implementation LFDiaryDetailHeaderView

- (instancetype)initWithDate:(NSDate *)date {
    if (self = [super init]) {
        [self setupSubViews];
        [self setupLayoutConstrain];
        self.date = date;
    }
    return self;
}

#pragma mark - Setter Method

- (void)setDate:(NSDate *)date {
    _date = date;
    self.dayLabel.text = [NSString stringWithFormat:@"%d", (int)date.lf_day];
    self.monthLabel.text = date.lf_monthStr_EN;
    self.yearLabel.text = date.lf_yearString_CN;
    self.weekLabel.text = date.lf_weekdayString;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d", (int)date.lf_hour, (int)date.lf_minute];
}

#pragma mark - UI About

- (void)setupSubViews {
    self.dayLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"STKaiti" size:50.0f];
        label.textColor = [UIColor blackColor];
        label;
    });
    [self addSubview:self.dayLabel];
    
    self.monthLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"STKaiti" size:25.0f];
        label.textColor = [UIColor blackColor];
        label;
    });
    [self addSubview:self.monthLabel];
    
    self.yearLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"STKaiti" size:20.0f];
        label.textColor = [UIColor blackColor];
        label;
    });
    [self addSubview:self.yearLabel];
    
    self.verticalLine1 = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor blackColor];
        view;
    });
    [self addSubview:self.verticalLine1];
    
    self.verticalLine2 = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor blackColor];
        view;
    });
    [self addSubview:self.verticalLine2];
    
    self.weatherImageView = ({
        UIImage *image = [UIImage imageNamed:@""];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView;
    });
    [self addSubview:self.weatherImageView];
    
    self.contentView = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
    [self addSubview:self.contentView];
    
    self.timeLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        label.textColor = [UIColor blackColor];
        label;
    });
    [self.contentView addSubview:self.timeLabel];
    
    self.weekLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        label.textColor = [UIColor blackColor];
        label;
    });
    [self.contentView addSubview:self.weekLabel];
    
    self.verticalLine3 = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor blackColor];
        view;
    });
    [self.contentView addSubview:self.verticalLine3];
}

- (void)setupLayoutConstrain {
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.left.equalTo(self.mas_left).offset(36);
    }];
    
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dayLabel.mas_bottom).offset(25);
        make.left.equalTo(self.mas_left).offset(36);
    }];
    
    [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verticalLine1.mas_bottom).offset(6);
        make.left.equalTo(self.mas_left).offset(36);
    }];
    
    [self.verticalLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.monthLabel.mas_bottom).offset(8);
        make.left.equalTo(self.mas_left).offset(36);
        make.width.equalTo(@150);
        make.height.equalTo(@1);
    }];
    
    [self.verticalLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yearLabel.mas_bottom).offset(6);
        make.left.equalTo(self.mas_left).offset(36);
        make.width.equalTo(@150);
        make.height.equalTo(@1);
    }];
    
    [self.weatherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@44);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(13);
    }];
    
    [self.weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.verticalLine3.mas_bottom).offset(5);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-40);
        make.bottom.equalTo(self.verticalLine2);
        make.width.equalTo(@50);
        make.height.equalTo(@60);
    }];
    
    [self.verticalLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
        make.height.equalTo(@1);
        make.left.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
    }];
}

@end
