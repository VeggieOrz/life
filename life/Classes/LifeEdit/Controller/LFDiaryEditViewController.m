//
//  LFDiaryEditViewController.m
//  life
//
//  Created by liuweihong on 2021/2/25.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryEditViewController.h"

@interface LFDiaryEditViewController ()
// 标题
@property (nonatomic, strong) UITextField *titleTextField;

@end

@implementation LFDiaryEditViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    [self setupLayoutConstrain];
}

#pragma mark - Public Method


#pragma mark - Private Method


#pragma mark - UI About

- (void)setupSubViews {
    
}

- (void)setupLayoutConstrain {
    
}

#pragma mark - Getter Method

- (UITextField *)titleTextField {
    if (!_titleTextField) {
        _titleTextField = [[UITextField alloc] init];
    }
    return _titleTextField;
}

@end
