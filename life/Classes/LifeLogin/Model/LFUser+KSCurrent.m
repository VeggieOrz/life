//
//  LFUser+KSCurrent.m
//  life
//
//  Created by liuweihong on 2021/4/28.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFUser+KSCurrent.h"

static LFUser *_user = nil;

@implementation LFUser (KSCurrent)

+ (instancetype)currentUser {
    return _user;
}

+ (void)setCurrentUser:(LFUser *)user {
    _user = user;
}

@end
