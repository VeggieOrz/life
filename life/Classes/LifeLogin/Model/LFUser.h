//
//  LFUser.h
//  life
//
//  Created by liuweihong on 2020/12/2.
//  Copyright © 2020 veggie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LFUser : NSObject

@property (nonatomic, assign) uint64_t uid;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *password;

+ (LFUser *)currentUser;

@end
