//
//  LFWeatherCell.h
//  life
//
//  Created by liuweihong on 2021/3/1.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFWeatherCell : UICollectionViewCell

- (void)congfigWithIndex:(NSInteger)index;

/// 设置 Cell 的被选中情况
/// @param selected YES 为被选中
- (void)setSelected:(BOOL)selected;


@end

NS_ASSUME_NONNULL_END
