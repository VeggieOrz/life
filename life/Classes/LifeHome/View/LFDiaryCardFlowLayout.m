//
//  LFDiaryCardFlowLayout.m
//  life
//
//  Created by liuweihong on 2021/2/20.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryCardFlowLayout.h"

@implementation LFDiaryCardFlowLayout

- (instancetype)init {
    if (self = [super init]) {
//        self.minimumLineSpacing =
//        self.minimumInteritemSpacing =
//        self.itemSize =
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

@end
