//
//  LFLoginViewController.m
//  life
//
//  Created by liuweihong on 2020/12/2.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFLoginViewController.h"
#import "LFLoginContentView.h"

@interface LFLoginViewController ()

@property (nonatomic, strong) LFLoginContentView *contentView;

@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView = [[LFLoginContentView alloc] initWithFrame:self.view.bounds];
    self.view = self.contentView;
    [self setupButtonAction];
}

#pragma mark - Action Method

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.contentView dismissKeyBoard];
}

- (void)didTaploginBtn:(id)sender {
    // 验证输入格式
    
    // 发起登陆请求
    
}

- (void)didTapRegisterBtn:(id)sender {
    // 跳转到注册页
}

- (void)didTapForgetBtn:(id)sender {
    
}

#pragma mark - Private Method

- (void)setupButtonAction {
    [self.contentView.loginBtn addTarget:self action:@selector(didTaploginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.registerBtn addTarget:self action:@selector(didTapRegisterBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.forgetBtn addTarget:self action:@selector(didTapForgetBtn:) forControlEvents:UIControlEventTouchUpInside];
}

@end
