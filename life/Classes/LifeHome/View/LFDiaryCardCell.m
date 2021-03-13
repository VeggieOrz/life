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

@end

@implementation LFDiaryCardCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupSubViews];
        [self setupLayoutConstrain];
        self.layer.cornerRadius = 10.0f;
        self.layer.masksToBounds = YES;
    }
    return self;
}

#pragma mark - Public Method

- (void)configWithDiary:(LFDiary *)diary {
    
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
        label.font = [UIFont systemFontOfSize:10.0f];
        label.textColor = [UIColor whiteColor];
        label.text = @"2021年，三月";
        label;
    });
    [self.bgView addSubview:self.ymLabel];
    
    self.dayLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:16.0f];
        label.textColor = [UIColor whiteColor];
        label.text = @"13";
        label;
    });
    [self.bgView addSubview:self.dayLabel];
    self.wtLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:10.0f];
        label.textColor = [UIColor whiteColor];
        label.text = @"星期六 15:36";
        label;
    });
    [self.bgView addSubview:self.wtLabel];
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
}

@end
