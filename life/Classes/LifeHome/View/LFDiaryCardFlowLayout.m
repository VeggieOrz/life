//
//  LFDiaryCardFlowLayout.m
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryCardFlowLayout.h"
#import "LFUIMacro.h"

#define CardCellWidth ((ScreenWidth - 40.0f) / 2)

const CGFloat kCardCellHeight = 250;

@implementation LFDiaryCardFlowLayout

- (instancetype)init {
    if (self = [super init]) {
        self.minimumLineSpacing = 16;
        self.minimumInteritemSpacing = 8;
        self.itemSize = CGSizeMake(CardCellWidth, kCardCellHeight);
        self.sectionInset = UIEdgeInsetsMake(16, 16, 0, 16);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

@end
