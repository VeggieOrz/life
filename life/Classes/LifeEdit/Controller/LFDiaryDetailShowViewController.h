//
//  LFDiaryDetailShowViewController.h
//  life
//
//  Created by liuweihong on 2021/2/28.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFDiary;

NS_ASSUME_NONNULL_BEGIN

/// 日记详情页
@interface LFDiaryDetailShowViewController : UIViewController

@property (nonatomic, strong) LFDiary *diary;

@end

NS_ASSUME_NONNULL_END
