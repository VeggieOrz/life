//
//  LFProfileDataShowView.m
//  life
//
//  Created by liuweihong on 2021/4/28.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFProfileDataShowView.h"
#import <Masonry/Masonry.h>

@interface LFProfileDataShowView ()

@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation LFProfileDataShowView

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubViews];
        [self setupLayoutConstraint];
    }
    return self;
}

- (instancetype)initWithNum:(NSString *)num unit:(NSString *)unit text:(NSString *)text {
    if (self = [self init]) {
        self.numLabel.text = num;
        self.unitLabel.text = unit;
        self.textLabel.text = text;
    }
    return self;
}

#pragma mark - Public Method

- (void)updateWithNum:(NSString *)num {
    self.numLabel.text = num;
}

#pragma mark - UI About

- (void)setupSubViews {
    [self addSubview:self.numLabel];
    [self addSubview:self.unitLabel];
    [self addSubview:self.textLabel];
}

- (void)setupLayoutConstraint {
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(16);
    }];
    
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(-8);
        make.left.equalTo(self.numLabel.mas_right).offset(16);
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(8);
        make.left.equalTo(self.numLabel.mas_right).offset(16);
    }];
}

#pragma mark - Getter Method

- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [UILabel new];
        _numLabel.font = [UIFont systemFontOfSize:40.0f weight:UIFontWeightBold];
        _numLabel.textColor = [UIColor blackColor];
        _numLabel.text = @"0";
    }
    return _numLabel;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [UILabel new];
        _unitLabel.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightMedium];
        _unitLabel.textColor = [UIColor blackColor];
        _unitLabel.text = @"篇";
    }
    return _unitLabel;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.text = @"已写日记";
    }
    return _textLabel;
}

@end
