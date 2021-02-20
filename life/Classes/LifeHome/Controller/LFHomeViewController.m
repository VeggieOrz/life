//
//  LFHomeViewController.m
//  life
//
//  Created by liuweihong on 2020/12/5.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFHomeViewController.h"
#import "LFDiaryCardCell.h"
#import "LFDiaryCardFlowLayout.h"

@interface LFHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LFHomeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [UICollectionViewCell new];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UI About

- (void)setupSubViews {
    [self.view addSubview:self.collectionView];
}


#pragma mark - Getter Method

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
    }
    return _collectionView;
}

@end
