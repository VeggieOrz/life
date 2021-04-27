//
//  LFProfileHeaderView.m
//  life
//
//  Created by liuweihong on 2021/4/27.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFProfileHeaderView.h"
#import <Masonry/Masonry.h>

const CGFloat kAvatarHeight = 64.0f;

@interface LFProfileHeaderView ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation LFProfileHeaderView

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubViews];
        [self setupLayoutConstraint];
        self.layer.cornerRadius = 8.0f;
    }
    return self;
}

#pragma mark - UI About

- (void)setupSubViews {
    [self addSubview:self.avatarImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.descriptionLabel];
    [self addSubview:self.contentLabel];
}

- (void)setupLayoutConstraint {
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@(kAvatarHeight));
        make.top.left.equalTo(@16);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarImageView).offset(6);
        make.left.equalTo(self.avatarImageView.mas_right).offset(16);
        make.right.equalTo(self.mas_right).offset(-16);
    }];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@42);
        make.height.equalTo(@16);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
        make.left.equalTo(self.nameLabel);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.lessThanOrEqualTo(@32);
        make.top.equalTo(self.descriptionLabel.mas_top);
        make.left.equalTo(self.descriptionLabel.mas_right);
        make.right.equalTo(self.mas_right).offset(-16);
    }];
}

#pragma mark - Getter Method

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [UIImageView new];
        _avatarImageView.backgroundColor = [UIColor grayColor];
        _avatarImageView.layer.cornerRadius = kAvatarHeight / 2;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:18.0f weight:UIFontWeightBold];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.text = @"神明少年";
    }
    return _nameLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [UILabel new];
        _descriptionLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        _descriptionLabel.textColor = [UIColor blackColor];
        _descriptionLabel.text = @"简介：";
    }
    return _descriptionLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"路上有阴影，但抬头总能看见阳光";
        _contentLabel.text = @"暂无";
    }
    return _contentLabel;
}

@end
