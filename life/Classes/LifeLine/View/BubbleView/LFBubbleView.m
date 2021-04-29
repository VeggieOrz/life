//
//  LFBubbleView.m
//  life
//
//  Created by liuweihong on 2021/2/14.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFBubbleView.h"
#import "UIView+frame.h"

@interface LFBubbleView ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation LFBubbleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.layer addSublayer:self.shapeLayer];
        // 添加阴影
        self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        self.layer.shadowOffset = CGSizeMake(5,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        self.layer.shadowOpacity = 0.1;//阴影透明度，默认0
        self.layer.shadowRadius = 3;
    }
    return self;
}


- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        CGFloat radius = 8.0f;
        CGFloat messageTextHeight = self.height;
        CGFloat messageTextWidth = self.width - 2 * radius;

        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(radius, 0)];
        [path addLineToPoint:CGPointMake(messageTextWidth, 0)];
        [path addArcWithCenter:CGPointMake(messageTextWidth + radius, radius) radius:radius startAngle:-M_PI_2 endAngle:0 clockwise:YES];//右上
        [path addLineToPoint:CGPointMake(messageTextWidth + 2 * radius, messageTextHeight - radius)];
        [path addArcWithCenter:CGPointMake(messageTextWidth + radius, messageTextHeight - radius) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];//右下
        [path addLineToPoint:CGPointMake(radius, messageTextHeight)];
        [path addArcWithCenter:CGPointMake(radius, messageTextHeight - radius) radius:radius startAngle:-M_PI*3/2.0 endAngle:-M_PI clockwise:YES];//左下
        [path addLineToPoint:CGPointMake(0, 30.0)];
        [path addLineToPoint:CGPointMake(-10.0, 25.0)];
        [path addLineToPoint:CGPointMake(0, 20.0)];
        [path addLineToPoint:CGPointMake(0, 20.0)];
        [path addLineToPoint:CGPointMake(0, radius)];
        [path addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:-M_PI endAngle:-M_PI_2 clockwise:YES];//左上
        
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        _shapeLayer.lineWidth=0.5;
        _shapeLayer.strokeColor= [UIColor whiteColor].CGColor;
        _shapeLayer.path= path.CGPath;
    }
    return _shapeLayer;
}

@end
