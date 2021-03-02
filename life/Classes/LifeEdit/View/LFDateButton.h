//
//  LFDateButton.h
//  life
//
//  Created by liuweihong on 2021/3/1.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFDateButton : UIButton

@property (nonatomic, strong) NSDate *date;

- (instancetype)initWithDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
