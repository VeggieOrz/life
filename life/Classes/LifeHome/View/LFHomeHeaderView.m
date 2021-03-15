//
//  LFHomeHeaderView.m
//  life
//
//  Created by liuweihong on 2021/3/12.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFHomeHeaderView.h"
#import "UIColor+RGBA.h"
#import <Masonry/Masonry.h>

@interface LFHomeHeaderView ()
// 日
@property (nonatomic, strong) UILabel *dayLabel;
// 月
@property (nonatomic, strong) UILabel *monthLabel;
// 时间
@property (nonatomic, strong) UILabel *timeLabel;
// 横线
@property (nonatomic, strong) UIView *lineView;
// 每日一文
@property (nonatomic, strong) UILabel *dailySentence;
// 今日一文提示
@property (nonatomic, strong) UILabel *todaySentenceTip;

@end

@implementation LFHomeHeaderView

#pragma mark - LifeCircle
- (instancetype)init {
    if (self = [super init]) {
        [self setupSubViews];
        [self setupLayoutConstrain];
    }
    return self;
}

#pragma mark - Public Method

#pragma mark - Private Method

#pragma mark - UI About

- (void)setupSubViews {
    [self addSubview:self.dayLabel];
    [self addSubview:self.monthLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.lineView];
    [self addSubview:self.dailySentence];
    [self addSubview:self.todaySentenceTip];
}

- (void)setupLayoutConstrain {
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self);
    }];
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.dayLabel.mas_bottom).offset(10);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.lineView.mas_right);
        make.bottom.equalTo(self.lineView.mas_top).offset(-7);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.monthLabel.mas_bottom).offset(12);
        make.width.equalTo(@170);
        make.height.equalTo(@0.5);
    }];
    [self.dailySentence mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView.mas_left);
        make.top.equalTo(self.lineView.mas_bottom).offset(10);
    }];
    [self.todaySentenceTip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dailySentence.mas_bottom).offset(8);
        make.right.equalTo(self.lineView.mas_right);
    }];
}

#pragma mark - Getter

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [UILabel new];
        _dayLabel.font = [UIFont fontWithName:@"STKaiti" size:50.0f];
        _dayLabel.textColor = [UIColor colorWithRGB:0x444444];
        _dayLabel.text = @"13";
    }
    return _dayLabel;
}

- (UILabel *)monthLabel {
    if (!_monthLabel) {
        _monthLabel = [UILabel new];
        _monthLabel.font = [UIFont fontWithName:@"STKaiti" size:20.0f];
        _monthLabel.textColor = [UIColor colorWithRGB:0x444444];
        _monthLabel.text = @"Mar";
    }
    return _monthLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont fontWithName:@"STKaiti" size:10.0f];
        _timeLabel.textColor = [UIColor colorWithRGB:0x444444];
        _timeLabel.text = @"21:35:11";
    }
    return _timeLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRGB:0x9b9b9b alpha:0.8];
    }
    return _lineView;
}

- (UILabel *)dailySentence {
    if (!_dailySentence) {
        _dailySentence = [UILabel new];
        _dailySentence.font = [UIFont fontWithName:@"STKaiti" size:12.0f];
        _dailySentence.textColor = [UIColor colorWithRGB:0x4f4f4f];
        _dailySentence.text = @"见到你后才开始相信爱情";
    }
    return _dailySentence;
}

- (UILabel *)todaySentenceTip {
    if (!_todaySentenceTip) {
        _todaySentenceTip = [UILabel new];
        _todaySentenceTip.font = [UIFont fontWithName:@"STKaiti" size:10.0f];
        _todaySentenceTip.textColor = [UIColor colorWithRGB:0x4f4f4f];
        _todaySentenceTip.text = @"今日一文";
    }
    return _todaySentenceTip;
}

@end
