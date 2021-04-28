//
//  LFEventDetailViewController.h
//  life
//
//  Created by liuweihong on 2021/4/6.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFEventModel;

NS_ASSUME_NONNULL_BEGIN

@interface LFEventDetailViewController : UIViewController

@property (nonatomic, strong) LFEventModel *eventModel;

@end

NS_ASSUME_NONNULL_END
