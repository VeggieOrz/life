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

#pragma mark - Private Method

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
    
    [self.upButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
    }];
    
    [self.downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
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

- (UIButton *)upButton {
    if (!_upButton) {
        _upButton = [UIButton new];
        [_upButton addTarget:self action:@selector(didTapUpButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _upButton;
}

- (UIButton *)downButton {
    if (!_downButton) {
        _downButton = [UIButton new];
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
