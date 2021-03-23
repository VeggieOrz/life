//
//  LFDiaryCardCell.h
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFDiary;

NS_ASSUME_NONNULL_BEGIN

@interface LFDiaryCardCell : UICollectionViewCell

- (void)configWithDiary:(LFDiary *)diary;

@end

NS_ASSUME_NONNULL_END
