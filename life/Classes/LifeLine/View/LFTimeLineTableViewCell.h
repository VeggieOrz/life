//
//  LFTimeLineTableViewCell.h
//  life
//
//  Created by liuweihong on 2021/2/14.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFEvenModel;

NS_ASSUME_NONNULL_BEGIN

@interface LFTimeLineTableViewCell : UITableViewCell

- (void)configWithModel:(LFEvenModel *)model;

@end

NS_ASSUME_NONNULL_END
