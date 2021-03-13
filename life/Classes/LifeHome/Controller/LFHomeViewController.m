//
//  LFHomeViewController.m
//  life
//
//  Created by liuweihong on 2020/12/5.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFHomeViewController.h"
#import "LFUIMacro.h"
#import "LFDiaryCardCell.h"
#import "LFDiaryCardFlowLayout.h"
#import "UICollectionView+Smart.h"
#import "UIColor+RGBA.h"
#import "UIView+frame.h"
#import "LFHomeHeaderView.h"
#import "LFLoginViewController.h"
#import <Masonry/Masonry.h>

@interface LFHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) LFHomeHeaderView *headerView;
@property (nonatomic, strong) UIView *maskView; // 渐变蒙层
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LFHomeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // 隐藏tabbar
    self.hidesBottomBarWhenPushed = YES;
//    self.view.backgroundColor = [UIColor blueColor];
    [self setupSubViews];
    [self setupLayoutConstraint];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    LFLoginViewController *loginVC = [[LFLoginViewController alloc] init];
//    [self.navigationController pushViewController:loginVC animated:NO];
}

#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
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
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.maskView];
    [self.view addSubview:self.collectionView];
    // 将蒙层提到最上层
    [self.view bringSubviewToFront:self.maskView];
}

- (void)setupLayoutConstraint {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBar_NaviBar_Height);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@176);
    }];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
        make.left.right.equalTo(self.headerView);
        make.height.equalTo(@8);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.headerView.mas_bottom);
    }];
}

#pragma mark - Getter Method

- (LFHomeHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[LFHomeHeaderView alloc] init];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [UIView new];
        _maskView.backgroundColor = [UIColor clearColor];
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = CGRectMake(0, 0, self.view.width, 8);
        UIColor *fromColor = [UIColor whiteColor];
        UIColor *toColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
        gradientLayer.colors = @[(id)fromColor.CGColor, (id)toColor.CGColor];
        gradientLayer.locations = @[@0.0, @1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1.0);
        [_maskView.layer addSublayer:gradientLayer];
    }
    return _maskView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        LFDiaryCardFlowLayout *flowLayout = [[LFDiaryCardFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor colorWithRGB:0xf6f7fb];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LFDiaryCardCell class]];
    }
    return _collectionView;
}

@end
