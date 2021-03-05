//
//  LFWeatherSelectorView.m
//  life
//
//  Created by liuweihong on 2021/3/1.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFWeatherSelectorView.h"
#import "LFWeatherCell.h"
#import "UICollectionView+Smart.h"
#import "LFUIMacro.h"
#import <Masonry/Masonry.h>

const NSInteger kWeatherCellCount = 12;
const CGFloat kWeatherCellWidth = 62.0f;
const CGFloat kContentViewWidth = 280.0f;
const CGFloat kContentViewHeight = 268.0f;
const CGFloat kOkButtonWidth = 170.0f;
const CGFloat kOkButtonHeight = 38.0f;

@interface LFWeatherSelectorView () <UICollectionViewDataSource, UICollectionViewDelegate>
// 承载View
@property (nonatomic, strong) UIView *contentView;
// 确认按钮
@property (nonatomic, strong) UIButton *okButton;
// 装载天气的CollectionView
@property (nonatomic, strong) UICollectionView *weatherCollectionView;
// 当前选择的下标
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation LFWeatherSelectorView

#pragma mark - Public Method

+ (void)showWithInitIdex:(NSInteger)index
             touchRemove:(BOOL)touchRemove
                   block:(LFWeatherSelectorBlock)buttonClickBlock {
    LFWeatherSelectorView *view = [[LFWeatherSelectorView alloc] init];
    view.touchRemove = touchRemove;
    view.currentIndex = index;
    view.buttonClickBlock = buttonClickBlock;
    [view show];
}

#pragma mark - Target Action

- (void)didTapOkButton:(id)sender {
    // 移除弹窗
    [self hide];
    // 执行回调
    if (self.buttonClickBlock) {
        self.buttonClickBlock(self.currentIndex);
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kWeatherCellCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LFWeatherCell *cell = [collectionView dequeueReusableCellWithCellClass:[LFWeatherCell class] forIndexPath:indexPath];
    [cell congfigWithIndex:indexPath.item];
    if (indexPath.item == self.currentIndex) {
        [cell setSelected:YES];
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *preIndexPath = [NSIndexPath indexPathForItem:self.currentIndex inSection:indexPath.section];
    LFWeatherCell *preCell = (LFWeatherCell *)[collectionView cellForItemAtIndexPath:preIndexPath];
    [preCell setSelected:NO];
    
    LFWeatherCell *selectedCell = (LFWeatherCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [selectedCell setSelected:YES];
    
    self.currentIndex = indexPath.item;
}

#pragma mark - UI About

- (void)setupUI {
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.weatherCollectionView];
    [self.contentView addSubview:self.okButton];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kContentViewWidth);
        make.height.mas_equalTo(kContentViewHeight);
        make.center.mas_equalTo(self);
    }];
    
    [self.weatherCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(16.0f);
        make.width.mas_equalTo(kWeatherCellWidth * 4);
        make.height.mas_equalTo(kWeatherCellWidth * 3);
    }];
    
    [self.okButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.weatherCollectionView.mas_bottom).offset(16);
        make.width.mas_equalTo(kOkButtonWidth);
        make.height.mas_equalTo(kOkButtonHeight);
    }];
}

#pragma mark - Getter Method

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 16.0f;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (UICollectionView *)weatherCollectionView {
    if (!_weatherCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake(kWeatherCellWidth, kWeatherCellWidth);
        _weatherCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _weatherCollectionView.backgroundColor = [UIColor whiteColor];
        _weatherCollectionView.dataSource = self;
        _weatherCollectionView.delegate = self;
        [_weatherCollectionView registerClass:[LFWeatherCell class]];
    }
    return _weatherCollectionView;
}

- (UIButton *)okButton {
    if (!_okButton) {
        _okButton = [[UIButton alloc] init];
        _okButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_okButton setBackgroundColor:[UIColor greenColor]];
        [_okButton setTitle:@"确定" forState:UIControlStateNormal];
        [_okButton addTarget:self action:@selector(didTapOkButton:) forControlEvents:UIControlEventTouchUpInside];
        _okButton.layer.cornerRadius = kOkButtonHeight / 2;
        _okButton.layer.masksToBounds = YES;
    }
    return _okButton;
}

@end
