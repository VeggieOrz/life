//
//  UIWindow+FlexSetting.m
//  life
//
//  Created by liuweihong on 2021/3/26.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "UIWindow+FlexSetting.h"
#if DEBUG
#import <FLEX/FLEXManager.h>
#endif

@implementation UIWindow (FlexSetting)

#if DEBUG
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [super motionBegan:motion withEvent:event];
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] showExplorer];
    }
}
#endif

@end
