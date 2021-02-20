//
//  UICollectionReusableView+Smart.m
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "UICollectionReusableView+Smart.h"

@implementation UICollectionReusableView (Smart)

+ (NSString *)defaultIdentifier {
    return [[NSStringFromClass([self class]) componentsSeparatedByString:@"."] lastObject];
}

@end
