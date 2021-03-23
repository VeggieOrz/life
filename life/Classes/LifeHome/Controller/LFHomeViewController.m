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
#import "UIImage+Color.h"
#import "LFHomeHeaderView.h"
#import "LFLoginViewController.h"
#import "LFDiaryEditViewController.h"
#import "LFDiaryDetailShowViewController.h"
#import "LFDiary.h"
#import <Masonry/Masonry.h>

@interface LFHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) LFHomeHeaderView *headerView;
@property (nonatomic, strong) UIView *maskView; // 渐变蒙层
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) LFDiary *diary;

@end

@implementation LFHomeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupSubViews];
    [self setupLayoutConstraint];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - Action Method

- (void)didTapEditButton:(id)sender {
    LFDiaryEditViewController *editVC = [[LFDiaryEditViewController alloc] init];
    // 隐藏tabbar
    editVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:editVC animated:YES];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LFDiaryCardCell *cell = [collectionView dequeueReusableCellWithCellClass:[LFDiaryCardCell class] forIndexPath:indexPath];
    [cell configWithDiary:self.diary];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LFDiaryDetailShowViewController *detailVC = [[LFDiaryDetailShowViewController alloc] init];
    detailVC.diary = self.diary;
    // 隐藏tabbar
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UI About

- (void)setupNavigationBar {
    // 设置导航栏颜色
    UIImage *backgroundImage = [UIImage lf_imageWithColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    // 设置右边按钮
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeSystem];
    editButton.imageEdgeInsets = UIEdgeInsetsMake(0, 28, 22, 0);
    UIImage *image = [UIImage imageNamed:@"home_edit"];
    [editButton setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(didTapEditButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:editButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setupSubViews {
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.maskView];
    [self.view addSubview:self.collectionView];
    // 将蒙层提到最上层
    [self.view bringSubviewToFront:self.maskView];
}

- (void)setupLayoutConstraint {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
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

// 测试代码
- (LFDiary *)diary {
    if (!_diary) {
        _diary = [LFDiary new];
        _diary.diaryWeather = LFDiaryWeatherCloudy;
        _diary.diaryDate = [NSDate date];
        _diary.diaryTitle = @"还是会想你";
        _diary.diaryContent = @"既不能断干净又不能和好如初的关系最难受";
    }
    return _diary;
}

@end
