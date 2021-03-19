//
//  LFLoginViewController.m
//  life
//
//  Created by liuweihong on 2020/12/2.
//  Copyright © 2020 veggie. All rights reserved.
//

#import "LFLoginViewController.h"
#import "LFLoginContentView.h"
#import "LFRegisterContentView.h"

@interface LFLoginViewController ()
// 登陆页 UI
@property (nonatomic, strong) LFLoginContentView *loginContentView;
// 注册页 UI
@property (nonatomic, strong) LFRegisterContentView *registerContentView;

@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginContentView = [[LFLoginContentView alloc] initWithFrame:self.view.bounds];
    self.loginContentView.backgroundColor = [UIColor whiteColor];
//    self.view = self.loginContentView;
    self.registerContentView = [[LFRegisterContentView alloc] initWithFrame:self.view.bounds];
    self.registerContentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginContentView];
    [self.view addSubview:self.registerContentView];
    // 将登陆界面移到最上层
    [self.view bringSubviewToFront:self.loginContentView];
    [self setupButtonAction];
}

#pragma mark - Action Method

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.loginContentView dismissKeyBoard];
}

- (void)didTaploginBtn:(id)sender {
    // 验证输入格式
    
    // 发起登陆请求
    
}

- (void)didTapToRegisterPageBtn:(id)sender {
    // 翻转到注册页
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionFlipFromLeft;
    [UIView transitionFromView:self.loginContentView toView:self.registerContentView duration:1 options:options completion:nil];
}

- (void)didTapForgetBtn:(id)sender {
    
}

- (void)didTapRegisterBtn:(id)sender {
    // 检查输入格式
    
    // 发送注册请求
}

- (void)didTapCloseBtn:(id)sender {
    // 翻转到登陆页
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionFromView:self.registerContentView toView:self.loginContentView duration:1 options:options completion:nil];
}

#pragma mark - Private Method

- (void)setupButtonAction {
    // 登录页相关事件
    [self.loginContentView.loginBtn addTarget:self action:@selector(didTaploginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginContentView.registerBtn addTarget:self action:@selector(didTapToRegisterPageBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginContentView.forgetBtn addTarget:self action:@selector(didTapForgetBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    // 注册页相关事件
    [self.registerContentView.registerBtn addTarget:self action:@selector(didTapRegisterBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerContentView.closeBtn addTarget:self action:@selector(didTapCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
}

@end
