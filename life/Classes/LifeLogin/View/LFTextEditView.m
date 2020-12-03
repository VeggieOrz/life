//
//  LFTextEditView.m
//  life
//
//  Created by liuweihong on 2020/12/3.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFTextEditView.h"
#import <Masonry/Masonry.h>

@interface LFTextEditView ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UITextField *inputField;

@end

@implementation LFTextEditView

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        self.iconView.image = image;
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.iconView];
    [self addSubview:self.inputField];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(24, 24));
        make.left.mas_equalTo(self.mas_left).offset(24);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(16);
        make.right.mas_equalTo(self.mas_right);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
}

#pragma mark - Getter

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UITextField *)inputField {
    if (!_inputField) {
        _inputField = [[UITextField alloc] init];
    }
    return _inputField;
}

@end
