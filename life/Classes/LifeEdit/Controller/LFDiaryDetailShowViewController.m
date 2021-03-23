//
//  LFDiaryDetailShowViewController.m
//  life
//
//  Created by liuweihong on 2021/2/28.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryDetailShowViewController.h"
#import "LFUIMacro.h"
#import "LFDiary.h"
#import "LFDiaryDetailHeaderView.h"
#import <Masonry/Masonry.h>

@interface LFDiaryDetailShowViewController ()

@property (nonatomic, strong) UIScrollView *scrollContentView;
@property (nonatomic, strong) LFDiaryDetailHeaderView *headerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation LFDiaryDetailShowViewController

#pragma mark - Life Cycle

- (instancetype)initWithDiary:(LFDiary *)diary {
    if (self = [super init]) {
        self.diary = diary;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    [self setupLayoutConstrain];
    [self _configData];
}

#pragma mark - Public Method


#pragma mark - Private Method

- (void)_configData {
    self.headerView.date = self.diary.diaryDate;
    self.titleLabel.text = self.diary.diaryTitle;
    self.contentLabel.text = self.diary.diaryContent;
}

#pragma mark - UI About

- (void)setupSubViews {
    [self.view addSubview:self.scrollContentView];
    [self.scrollContentView addSubview:self.headerView];
    [self.scrollContentView addSubview:self.titleLabel];
    [self.scrollContentView addSubview:self.contentLabel];
}

- (void)setupLayoutConstrain {
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.scrollContentView);
        make.width.equalTo(@(ScreenWidth));
        make.height.equalTo(@180);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.bottom.equalTo(self.scrollContentView);
    }];
}

#pragma mark - Getter Method

- (UIScrollView *)scrollContentView {
    if (!_scrollContentView) {
        _scrollContentView = [[UIScrollView alloc] init];
    }
    return _scrollContentView;
}

- (LFDiaryDetailHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[LFDiaryDetailHeaderView alloc] initWithDate:[NSDate date]];
    }
    return _headerView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"STKaiti" size:20.0f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = @"网络层设计方案";
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont fontWithName:@"STKaiti" size:16.0f];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"网络层在一个App中也是一个不可缺少的部分，工程师们在网络层能够发挥的空间也比较大。另外，苹果对网络请求部分已经做了很好的封装，业界的AFNetworking也被广泛使用。其它的ASIHttpRequest，MKNetworkKit啥的其实也都还不错，但前者已经弃坑，后者也在弃坑的边缘。在实际的App开发中，Afnetworking已经成为了事实上各大App的标准配置。\n\n网络层在一个App中承载了API调用，用户操作日志记录，甚至是即时通讯等任务。我接触过一些App（开源的和不开源的）的代码，在看到网络层这一块时，尤其是在看到各位架构师各显神通展示了各种技巧，我非常为之感到兴奋。但有的时候，往往也对于其中的一些缺陷感到失望。。\n\n网络层在一个App中承载了API调用，用户操作日志记录，甚至是即时通讯等任务。我接触过一些App（开源的和不开源的）的代码，在看到网络层这一块时，尤其是在看到各位架构师各显神通展示了各种技巧，我非常为之感到兴奋。但有的时候，往往也对于其中的一些缺陷感到失望。。\n\n网络层在一个App中承载了API调用，用户操作日志记录，甚至是即时通讯等任务。我接触过一些App（开源的和不开源的）的代码，在看到网络层这一块时，尤其是在看到各位架构师各显神通展示了各种技巧，我非常为之感到兴奋。但有的时候，往往也对于其中的一些缺陷感到失望。。\n\n网络层在一个App中承载了API调用，用户操作日志记录，甚至是即时通讯等任务。我接触过一些App（开源的和不开源的）的代码，在看到网络层这一块时，尤其是在看到各位架构师各显神通展示了各种技巧，我非常为之感到兴奋。但有的时候，往往也对于其中的一些缺陷感到失望。";
    }
    return _contentLabel;
}

@end
