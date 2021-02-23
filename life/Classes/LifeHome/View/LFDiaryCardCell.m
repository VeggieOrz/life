//
//  LFDiaryCardCell.m
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryCardCell.h"

@implementation LFDiaryCardCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius = 10.0f;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
