//
//  LFDiaryCardCell.m
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryCardCell.h"
#import "LFDiary.h"
#import "UIColor+RGBA.h"
#import "NSDate+Easy.h"
#import <Masonry/Masonry.h>

@interface LFDiaryCardCell ()
// 顶部背景
@property (nonatomic, strong) UIView *bgView;
// 年月显示
@property (nonatomic, strong) UILabel *ymLabel;
// 日期显示
@property (nonatomic, strong) UILabel *dayLabel;
// 星期、时间显示
@property (nonatomic, strong) UILabel *wtLabel;
// 标题
@property (nonatomic, strong) UILabel *titleLabel;
// 内容
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation LFDiaryCardCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupSubViews];
        [self setupLayoutConstrain];
        // 上层的 contentView 设置圆角
        self.contentView.layer.cornerRadius = 10.0f;
        self.contentView.layer.masksToBounds = YES;
        // 下层的 View 设置阴影
        self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        self.layer.shadowOffset = CGSizeMake(5,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        self.layer.shadowOpacity = 0.1;//阴影透明度，默认0
        self.layer.shadowRadius = 3;
    }
    return self;
}

#pragma mark - Public Method

- (void)configWithDiary:(LFDiary *)diary {
    // 时间设置
    NSDate *diaryDate = diary.diaryDate;
    self.ymLabel.text = [NSString stringWithFormat:@"%d年，%@", (int)diaryDate.lf_year, diaryDate.lf_monthStr_CN];
    self.dayLabel.text = @(diaryDate.lf_day).stringValue;
    self.wtLabel.text = [NSString stringWithFormat:@"%@ %02d:%02d", diaryDate.lf_weekdayString_CN, (int)diaryDate.lf_hour, (int)diaryDate.lf_minute];
    // 内容设置
    self.titleLabel.text = diary.diaryTitle;
    self.contentLabel.text = diary.diaryContent;
}

#pragma mark - Private Method


#pragma mark - UI About

- (void)setupSubViews {
    self.bgView = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithRGB:0x5783ae];
        view;
    });
    [self.contentView addSubview:self.bgView];
    
    self.ymLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"STKaiti" size:12.0f];
        label.textColor = [UIColor whiteColor];
        label.text = @"2021年，三月";
        label;
    });
    [self.bgView addSubview:self.ymLabel];
    
    self.dayLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"STKaiti" size:18.0f];
        label.textColor = [UIColor whiteColor];
        label.text = @"13";
        label;
    });
    [self.bgView addSubview:self.dayLabel];
    self.wtLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"STKaiti" size:12.0f];
        label.textColor = [UIColor whiteColor];
        label.text = @"星期六 15:36";
        label;
    });
    [self.bgView addSubview:self.wtLabel];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
}

- (void)setupLayoutConstrain {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(@70);
    }];
    [self.ymLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.equalTo(self.bgView.mas_top).offset(5);
    }];
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.equalTo(self.ymLabel.mas_bottom).offset(3);
    }];
    [self.wtLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.equalTo(self.dayLabel.mas_bottom).offset(3);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(16);
        make.left.equalTo(self.contentView).offset(16);
        make.right.equalTo(self.contentView).offset(-16);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.left.right.equalTo(self.titleLabel);
    }];
}

#pragma mark - Getter Method

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor colorWithRGB:0x0f0f0f];
        _titleLabel.font = [UIFont fontWithName:@"STKaiti" size:13.0f];
        _titleLabel.text = @"还是会想你";
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor colorWithRGB:0x4f4f4f];
        _contentLabel.font = [UIFont fontWithName:@"STKaiti" size:12.0f];
        _contentLabel.text = @"既不能断干净又不能和好如初的关系最难受";
    }
    return _contentLabel;
}

@end
