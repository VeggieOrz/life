//
//  UICollectionViewCell+Smart.m
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "UICollectionViewCell+Smart.h"

@implementation UICollectionViewCell (Smart)

+ (NSString *)defaultIdentifier {
    return [[NSStringFromClass([self class]) componentsSeparatedByString:@"."] lastObject];
}

@end
