//
//  LFProfileDataShowView.h
//  life
//
//  Created by liuweihong on 2021/4/28.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFProfileDataShowView : UIView

- (instancetype)initWithNum:(NSString *)num unit:(NSString *)unit text:(NSString *)text;

- (void)updateWithNum:(NSString *)num;

@end

NS_ASSUME_NONNULL_END
