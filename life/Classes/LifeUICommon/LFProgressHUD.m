//
//  LFProgressHUD.m
//  life
//
//  Created by liuweihong on 2021/4/28.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFProgressHUD.h"

@implementation LFProgressHUD

- (instancetype)initWithView:(UIView *)view {
    if (self = [super initWithView:view]) {
        self.contentColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        self.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    }
    return self;
}

@end
