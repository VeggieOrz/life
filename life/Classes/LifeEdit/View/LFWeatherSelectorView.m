//
//  LFWeatherSelectorView.m
//  life
//
//  Created by liuweihong on 2021/3/1.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFWeatherSelectorView.h"
#import <Masonry/Masonry.h>

@interface LFWeatherSelectorView () <UICollectionViewDataSource, UICollectionViewDelegate>
// 承载View
@property (nonatomic, strong) UIView *contentView;
// 确认按钮
@property (nonatomic, strong) UIButton *okButton;
// 装载天气的CollectionView
@property (nonatomic, strong) UICollectionView *weatherCollectionView;

@end

@implementation LFWeatherSelectorView

#pragma mark - Public Method

- (void)show {
    
}

- (void)hide {
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [UICollectionViewCell new];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Private Method


#pragma mark - UI About

- (void)setupSubViews {
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.weatherCollectionView];
    [self.contentView addSubview:self.okButton];
}

- (void)setupLayoutConstrain {
    
}

#pragma mark - Getter Method

- (UIView *)contentView {
    if (!_contentView) {
        
    }
    return _contentView;
}

- (UICollectionView *)weatherCollectionView {
    if (!_weatherCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        _weatherCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _weatherCollectionView.dataSource = self;
        _weatherCollectionView.delegate = self;
    }
    return _weatherCollectionView;
}


@end
