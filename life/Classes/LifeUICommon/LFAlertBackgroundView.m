//
//  LFAlertBackgroundView.m
//  life
//
//  Created by liuweihong on 2021/3/5.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFAlertBackgroundView.h"
#import "LFUIMacro.h"

@interface LFAlertBackgroundView () <UIGestureRecognizerDelegate>

// 承载View
@property (nonatomic, strong) UIView *contentView;

@end


@implementation LFAlertBackgroundView

#pragma mark - LifeCycle

- (instancetype)initWithFrame:(CGRect)frame {
    frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6f];
        self.touchRemove = NO;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeSelf)];
        tapGestureRecognizer.delegate = self;
        [self addGestureRecognizer:tapGestureRecognizer];
        [self setupUI];
    }
    return self;
}

- (void)removeSelf {
    if (self.superview && self.touchRemove) {
        [self removeFromSuperview];
    }
}

#pragma mark - Public Method

- (void)setupUI {}

- (void)show {
    // 避免重复展示
    [self hide];
    
    self.alpha = 0.0;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 1.0;
    } completion:nil];
}

- (void)hide {
    if (self.superview) {
        [self removeFromSuperview];
    }
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationInView:self];
    if (CGRectContainsPoint(self.contentView.frame, point)) {
        return NO;
    }
    return YES;
}

@end
