//
//  LFSettingItemCell.m
//  life
//
//  Created by liuweihong on 2021/4/21.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFSettingItemCell.h"
#import "LFSettingItem.h"
#import "LFUIMacro.h"
#import <Masonry/Masonry.h>

const CGFloat kCellPadding = 16.0f;

@implementation LFSettingItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        [self setupSubViews];
        [self setupLayoutConstraint];
    }
    return self;
}

#pragma mark - Public Method

- (void)configWithItem:(LFSettingItem *)item {
    switch (item.cellType) {
        case LFSettingCellTypeNone:
            
            break;
            
        case LFSettingCellTypeRightArrow:
            self.titleLabel.text = item.title;
            // 设置控件的显示
            self.titleLabel.hidden = NO;
            self.rightArrow.hidden = NO;
            self.switchButton.hidden = YES;
            self.centerButton.hidden = YES;
            break;
            
        case LFSettingCellTypeSwitch:
            self.titleLabel.text = item.title;
            // 设置控件的显示
            self.titleLabel.hidden = NO;
            self.rightArrow.hidden = YES;
            self.switchButton.hidden = NO;
            self.centerButton.hidden = YES;
            break;
            
        case LFSettingCellTypeLogout:
            [self.centerButton setTitle:item.centerTitle forState:UIControlStateNormal];
            // 设置控件的显示
            self.titleLabel.hidden = YES;
            self.rightArrow.hidden = YES;
            self.switchButton.hidden = YES;
            self.centerButton.hidden = NO;
            break;
    }
}

#pragma mark - Override Method

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = kCellPadding;
    frame.size.width -= 2 * kCellPadding;
    [super setFrame:frame];
}

#pragma mark - UI About

- (void)setupSubViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.rightArrow];
    [self.contentView addSubview:self.switchButton];
    [self.contentView addSubview:self.centerButton];
}

- (void)setupLayoutConstraint {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16.0f);
    }];
    [self.rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-16.0f);
        make.width.height.equalTo(@20);
    }];
    [self.switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-16.0f);
        make.height.equalTo(@24);
        make.width.equalTo(@48);
    }];
    [self.centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

#pragma mark - Getter Method

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UIImageView *)rightArrow {
    if (!_rightArrow) {
        UIImage *image = [UIImage imageNamed:@"setting_rightarrow"];
        _rightArrow = [[UIImageView alloc] initWithImage:image];
        
    }
    return _rightArrow;
}

- (UISwitch *)switchButton {
    if (!_switchButton) {
        _switchButton = [[UISwitch alloc] init];
    }
    return _switchButton;
}

- (UIButton *)centerButton {
    if (!_centerButton) {
        _centerButton = [[UIButton alloc] init];
        _centerButton.backgroundColor = [UIColor redColor];
        _centerButton.titleLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        [_centerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _centerButton.layer.cornerRadius = 12.0f;
    }
    return _centerButton;
}

@end
