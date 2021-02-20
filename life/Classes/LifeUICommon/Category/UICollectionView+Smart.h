//
//  UICollectionView+Smart.h
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Smart)

#pragma mark - Cell

- (void)registerClass:(nullable Class)cellClass;
- (void)registerNib:(nullable UINib *)nib forCellClass:(nullable Class)cellClass;
- (__kindof UICollectionViewCell *)dequeueReusableCellWithCellClass:(nullable Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

#pragma mark - Header & Footer

- (void)registerClass:(nullable Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind;
- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withViewClass:(nullable Class)viewClass forIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
