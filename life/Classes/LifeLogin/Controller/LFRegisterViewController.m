//
//  LFRegisterViewController.m
//  life
//
//  Created by liuweihong on 2020/12/2.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFRegisterViewController.h"
#import "LFRegisterContentView.h"

@interface LFRegisterViewController ()

@property (nonatomic, strong) LFRegisterContentView *contentView;

@end

@implementation LFRegisterViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView = [[LFRegisterContentView alloc] initWithFrame:self.view.bounds];
    self.view = self.contentView;
    [self setupButtonAction];
}

#pragma mark - Action Mehtod

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.contentView dismissKeyBoard];
}

- (void)didTapRegisterBtn:(id)sender {
    // 检查输入格式
    
    // 发送注册请求
}

- (void)didTapCloseBtn:(id)sender {
    // 跳转到登陆页
    
}

#pragma mark - Priavte Method

- (void)setupButtonAction {
    [self.contentView.registerBtn addTarget:self action:@selector(didTapRegisterBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.closeBtn addTarget:self action:@selector(didTapCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
}

@end
