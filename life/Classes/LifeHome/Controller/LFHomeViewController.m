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
#import "UICollectionView+Smart.h"
#import <Masonry/Masonry.h>

@interface LFHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LFHomeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    [self setupLayoutConstraint];
}

#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LFDiaryCardCell *cell = [collectionView dequeueReusableCellWithCellClass:[LFDiaryCardCell class] forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UI About

- (void)setupSubViews {
    [self.view addSubview:self.collectionView];
}

- (void)setupLayoutConstraint {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Getter Method

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        LFDiaryCardFlowLayout *flowLayout = [[LFDiaryCardFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LFDiaryCardCell class]];
    }
    return _collectionView;
}

@end
