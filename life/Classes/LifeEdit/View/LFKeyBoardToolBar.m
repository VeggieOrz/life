//
//  LFKeyBoardToolBar.m
//  life
//
//  Created by liuweihong on 2021/3/17.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFKeyBoardToolBar.h"
#import "UIColor+RGBA.h"
#import <Masonry/Masonry.h>

@interface LFKeyBoardToolBar ()

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *upButton;
@property (nonatomic, strong) UIButton *downButton;
@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation LFKeyBoardToolBar

#pragma mark - Life Cycle

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubViews];
        [self setupLayoutConstrain];
    }
    return self;
}

#pragma mark - Public Method

- (void)setViewsWithStatus:(BOOL)isUp {
    self.upButton.enabled = !isUp;
    self.downButton.enabled = isUp;
    // 动画
    CGFloat alpha = isUp ? 1.0f : 0;
    [UIView animateWithDuration:0.5f animations:^{
        self.titleLabel.alpha = alpha;
    }];
}

#pragma mark - Acton Method

- (void)didTapUpButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didTapUpButton:)]) {
        [self.delegate didTapUpButton:self];
    }
}

- (void)didTapDownButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didTapDownButton:)]) {
        [self.delegate didTapDownButton:self];
    }
}

- (void)didTapDoneButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didTapDoneButton:)]) {
        [self.delegate didTapDoneButton:self];
    }
}

#pragma mark - UI About

- (void)setupSubViews {
    [self addSubview:self.topLine];
    [self addSubview:self.titleLabel];
    [self addSubview:self.upButton];
    [self addSubview:self.downButton];
    [self addSubview:self.doneButton];
}

- (void)setupLayoutConstrain {
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@0.5);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self.upButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.centerY.equalTo(self);
        make.width.height.equalTo(@22);
    }];
    
    [self.downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.upButton.mas_right).offset(12);
        make.centerY.equalTo(self);
        make.width.height.equalTo(@22);
    }];
    
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-16);
        make.centerY.equalTo(self);
    }];
}

#pragma mark - Getter Method

-(UIView *)topLine {
    if (!_topLine) {
        _topLine = [UIView new];
        _topLine.backgroundColor = [UIColor colorWithRGB:0xc7c7c7];
    }
    return _topLine;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont fontWithName:@"STKaiti" size:18.0f];
        _titleLabel.textColor = [UIColor colorWithRGB:0xc7c7c7];
        _titleLabel.text = @"标题";
    }
    return _titleLabel;
}

- (UIButton *)upButton {
    if (!_upButton) {
        _upButton = [UIButton new];
        [_upButton setImage:[UIImage imageNamed:@"edit_up_enable"] forState:UIControlStateNormal];
        [_upButton setImage:[UIImage imageNamed:@"edit_up_disable"] forState:UIControlStateDisabled];
        [_upButton addTarget:self action:@selector(didTapUpButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _upButton;
}

- (UIButton *)downButton {
    if (!_downButton) {
        _downButton = [UIButton new];
        [_downButton setImage:[UIImage imageNamed:@"edit_down_enable"] forState:UIControlStateNormal];
        [_downButton setImage:[UIImage imageNamed:@"edit_down_disable"] forState:UIControlStateDisabled];
        [_downButton addTarget:self action:@selector(didTapDownButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _downButton;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton new];
        _doneButton.titleLabel.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightMedium];
        [_doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [_doneButton setTitleColor:[UIColor colorWithRGB:0x5783ae] forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(didTapDoneButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end
