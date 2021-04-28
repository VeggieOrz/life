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
#import "LFEventModel.h"
#import "UIView+frame.h"
#import "UIColor+RGBA.h"
#import "NSDate+Easy.h"

const CGFloat kLineLeftPadding = 67.0f;
const CGFloat kPointViewWidth = 12.0f;
const CGFloat kContentLRPadding = 7.0f;
const CGFloat kContentUDPadding = 5.0f;

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
// 过去的时间
@property (nonatomic, strong) UILabel *passTimeLabel;

@end

@implementation LFTimeLineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor colorWithRGB:0xf5f6f7];
        [self setupSubViews];
    }
    return self;
}

#pragma mark - Public Method

- (void)configWithModel:(LFEventModel *)model {
    self.dateLabel.attributedText = [self _getStringWithDate:model.eventDate];
    
}

#pragma mark - Private Method

- (NSAttributedString *)_getStringWithDate:(NSDate *)date {
    NSString *str = @"04周四\n2021.02";
//    NSString *str = [NSString stringWithFormat:@"%02d%@\n%d.%02d", (int)date.lf_day, date.lf_weekdayString, (int)date.lf_year, (int)date.lf_month];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0f weight:UIFontWeightMedium] range:NSMakeRange(0, 2)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"STKaiti" size:12.0f] range:NSMakeRange(2, str.length - 2)];
    return attributedString;
}

#pragma mark - UI About

- (void)setupSubViews {
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.verticalLine1];
    [self.contentView addSubview:self.pointView];
    [self.contentView addSubview:self.verticalLine2];
    [self.contentView addSubview:self.bubbleView];
    [self.bubbleView addSubview:self.contentLabel];
}

#pragma mark - Getter Method

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        CGRect frame = CGRectMake(8, 16, 47, 40);
        _dateLabel = [[UILabel alloc] initWithFrame:frame];
        _dateLabel.numberOfLines = 0;
//        _dateLabel.text = @"??";
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
        CGRect frame = CGRectMake(kContentLRPadding, kContentUDPadding, self.bubbleView.width - 2 * kContentLRPadding, self.bubbleView.height - 2 * kContentUDPadding);
        _contentLabel = [[UILabel alloc] initWithFrame:frame];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont fontWithName:@"STKaiti" size:14.0f];
        _contentLabel.text = @"历法能使人类确定每一日再无限的时间中的确切位置并记录历史。日历，历法，一般历法都是遵循固定的规则的，具有周期性。日历都是已知的或可预测的。";
    }
    return _contentLabel;
}

@end
