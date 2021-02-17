//
//  LFDiary.h
//  life
//
//  Created by liuweihong on 2021/2/17.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFDiary : NSObject
// 日记标题
@property (nonatomic, copy) NSString *diaryTitle;
// 日记内容
@property (nonatomic, copy) NSString *diaryContent;
// 日记日期
@property (nonatomic, strong) NSDate *diaryDate;

@end

NS_ASSUME_NONNULL_END
