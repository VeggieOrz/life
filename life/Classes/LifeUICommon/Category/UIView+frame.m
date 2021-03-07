//
//  UIView+frame.m
//  life
//
//  Created by liuweihong on 2021/1/31.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)


#pragma mark - Getter Method
- (CGFloat)x {
    return self.bounds.origin.x;
}

- (CGFloat)y {
    return self.bounds.origin.y;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (CGFloat)height {
    return self.bounds.size.height;
}

- (CGPoint)origin {
    return self.bounds.origin;
}

- (CGSize)size {
    return self.bounds.size;
}

#pragma mark - Setter Method

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
