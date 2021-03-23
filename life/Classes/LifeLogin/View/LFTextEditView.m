//
//  LFTextEditView.m
//  life
//
//  Created by liuweihong on 2020/12/3.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFTextEditView.h"
#import "UIColor+RGBA.h"
#import <Masonry/Masonry.h>

@interface LFTextEditView ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UITextField *inputField;

@end

@implementation LFTextEditView

- (instancetype)initWithImage:(UIImage *)image
                  placeholder:(NSString *)placeholder {
    if (self = [super init]) {
        self.iconView.image = image;
        NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:placeholder
                                                                           attributes:@{
                                                                               NSForegroundColorAttributeName:[UIColor colorWithRGB:0x515151],
                                                                               NSFontAttributeName:self.inputField.font
                                                                           }];
        self.inputField.attributedPlaceholder = attributeStr;
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.layer.cornerRadius < 0.01f) {
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = [UIColor colorWithRGB:0x515151].CGColor;
        self.layer.cornerRadius = self.bounds.size.height / 2;
        self.layer.masksToBounds = YES;
    }
}

#pragma mark - Public Method

- (void)setSecureTextEntry:(BOOL)secureTextEntry {
    self.inputField.secureTextEntry = secureTextEntry;
}

- (void)dismissKeyBoard {
    [self.inputField resignFirstResponder];
}

#pragma mark - UI About

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
        make.right.mas_equalTo(self.mas_right).offset(-16);
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
        _inputField.textColor = [UIColor colorWithRGB:0x515151];
        _inputField.font = [UIFont fontWithName:@"STKaiti" size:16.0f];
    }
    return _inputField;
}

@end
