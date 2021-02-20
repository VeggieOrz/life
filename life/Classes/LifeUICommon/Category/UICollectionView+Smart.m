//
//  UICollectionView+Smart.m
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "UICollectionView+Smart.h"
#import "UICollectionViewCell+Smart.h"
#import "UICollectionReusableView+Smart.h"

@implementation UICollectionView (Smart)

#pragma mark - Cell

- (void)registerClass:(nullable Class)cellClass {
    [self registerClass:cellClass forCellWithReuseIdentifier:[cellClass defaultIdentifier]];
}
- (void)registerNib:(nullable UINib *)nib forCellClass:(nullable Class)cellClass {
    [self registerNib:nib forCellWithReuseIdentifier:[cellClass defaultIdentifier]];
}
- (__kindof UICollectionViewCell *)dequeueReusableCellWithCellClass:(nullable Class)cellClass forIndexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithReuseIdentifier:[cellClass defaultIdentifier] forIndexPath:indexPath];
}

#pragma mark - Header & Footer

- (void)registerClass:(nullable Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind {
    [self registerClass:viewClass forSupplementaryViewOfKind:elementKind withReuseIdentifier:[viewClass defaultIdentifier]];
}

- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withViewClass:(nullable Class)viewClass forIndexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:[viewClass defaultIdentifier] forIndexPath:indexPath];
}

@end
