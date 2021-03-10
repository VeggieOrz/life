//
//  LFWeatherCell.m
//  life
//
//  Created by liuweihong on 2021/3/1.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFWeatherCell.h"
#import "UIView+frame.h"
#import <Masonry/Masonry.h>

@interface LFWeatherCell ()

@property (nonatomic, strong) UIImageView *weatherImageView;

@property (nonatomic, strong) CAShapeLayer *borderLayer;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) NSInteger index;

@end

@implementation LFWeatherCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (void)congfigWithIndex:(NSInteger)index {
    NSString *imageName = [NSString stringWithFormat:@"weather_%d", (int)index];
    UIImage *image = [UIImage imageNamed:imageName];
    [self.weatherImageView setImage:image];
}

- (void)setSelected:(BOOL)selected {
    self.borderLayer.hidden = !selected;
}

- (void)setupSubViews {
    [self addSubview:self.weatherImageView];
    [self.layer addSublayer:self.borderLayer];
    
    [self.weatherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.right.bottom.equalTo(self.contentView).offset(-10);
    }];
}

#pragma mark - Getter Method

- (UIImageView *)weatherImageView {
    if (!_weatherImageView) {
        _weatherImageView = [[UIImageView alloc] init];
    }
    return _weatherImageView;
}

- (CAShapeLayer *)borderLayer {
    if (!_borderLayer) {
        _borderLayer = [CAShapeLayer layer];
        CGFloat padding = 2;
        CGRect frame = CGRectMake(self.x + padding, self.y + padding, self.width - padding * 2, self.width - padding * 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:8.0f];
        _borderLayer.path = path.CGPath;
        _borderLayer.fillColor = [UIColor clearColor].CGColor;
        _borderLayer.strokeColor = [UIColor blueColor].CGColor;
        _borderLayer.hidden = YES;
    }
    return _borderLayer;
}

@end
