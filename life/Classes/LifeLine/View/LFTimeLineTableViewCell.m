//
//  LFTimeLineTableViewCell.m
//  life
//
//  Created by liuweihong on 2021/2/14.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFTimeLineTableViewCell.h"
#import "LFTimeLineViewController.h"
#import "LFUIMacro.h"
#import "LFBubbleView.h"
#import "UIView+frame.h"

const CGFloat kLineLeftPadding = 67;
const CGFloat kPointViewWidth = 12;

@interface LFTimeLineTableViewCell ()
// 日期标签
@property (nonatomic, strong) UILabel *dateLabel;
// 左边竖线1
@property (nonatomic, strong) UIView *verticalLine1;
// 左边竖线2
@property (nonatomic, strong) UIView *verticalLine2;
// 竖线中的点
@property (nonatomic, strong) UIView *pointView;
// 会话气泡View
@property (nonatomic, strong) LFBubbleView *bubbleView;
// 内容标签
@property (nonatomic, strong) UILabel *contentLabel;
// 日记图片
@property (nonatomic, strong) UIImageView *contentImageView;

@end

@implementation LFTimeLineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

#pragma mark - Public Method


#pragma mark - UI About

- (void)setupSubViews {
//    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.verticalLine1];
    [self.contentView addSubview:self.pointView];
    [self.contentView addSubview:self.verticalLine2];
    [self.contentView addSubview:self.bubbleView];
    [self.bubbleView addSubview:self.contentLabel];
//    [self.contentView addSubview:self.contentImageView];
}

#pragma mark - Getter Method

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        
    }
    return _dateLabel;
}

- (UIView *)verticalLine1 {
    if (!_verticalLine1) {
        CGRect frame = CGRectMake(kLineLeftPadding, 0, 1, kTimeLineCellHeight / 3);
        _verticalLine1 = [[UIView alloc] initWithFrame:frame];
        _verticalLine1.backgroundColor = [UIColor blackColor];
    }
    return _verticalLine1;
}

- (UIView *)verticalLine2 {
    if (!_verticalLine2) {
        CGRect frame = CGRectMake(kLineLeftPadding, kTimeLineCellHeight / 3 + kPointViewWidth, 1, kTimeLineCellHeight / 3 * 2 - kPointViewWidth);
        _verticalLine2 = [[UIView alloc] initWithFrame:frame];
        _verticalLine2.backgroundColor = [UIColor blackColor];
    }
    return _verticalLine2;
}

- (UIView *)pointView {
    if (!_pointView) {
        CGRect frame = CGRectMake(kLineLeftPadding - kPointViewWidth / 2 + 0.5f, kTimeLineCellHeight / 3, kPointViewWidth, kPointViewWidth);
        _pointView = [[UIView alloc] initWithFrame:frame];
        _pointView.backgroundColor = [UIColor clearColor];
        CAShapeLayer *layer = [CAShapeLayer layer];
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:_pointView.bounds cornerRadius:kPointViewWidth / 2];
        layer.path = bezierPath.CGPath;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeColor = [UIColor blackColor].CGColor;
        [_pointView.layer addSublayer:layer];
    }
    return _pointView;
}

- (LFBubbleView *)bubbleView {
    if (!_bubbleView) {
        CGFloat x = kLineLeftPadding + 22;
        CGRect frame = CGRectMake(x, 15, ScreenWidth - x - 10, kTimeLineCellHeight - 20);
        _bubbleView = [[LFBubbleView alloc] initWithFrame:frame];
    }
    return _bubbleView;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        
    }
    return _contentLabel;
}

- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        
    }
    return _contentImageView;
}

@end
