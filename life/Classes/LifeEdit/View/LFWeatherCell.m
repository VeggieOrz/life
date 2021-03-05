//
//  LFWeatherCell.m
//  life
//
//  Created by liuweihong on 2021/3/1.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFWeatherCell.h"

@interface LFWeatherCell ()

@property (nonatomic, strong) UIImageView *weatherImageView;

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
    
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.contentView.backgroundColor = [UIColor blueColor];
    } else {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
}

- (void)setupSubViews {
    [self addSubview:self.weatherImageView];
}

@end
