//
//  LFUser+KSCurrent.h
//  life
//
//  Created by liuweihong on 2021/4/28.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFUser (KSCurrent)

+ (instancetype)currentUser;

+ (void)setCurrentUser:(LFUser *)user;

@end

NS_ASSUME_NONNULL_END
