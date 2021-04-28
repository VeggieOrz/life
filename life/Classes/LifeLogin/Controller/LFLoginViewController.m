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
#import "LFTabBarController.h"
#import "LFProgressHUD.h"
#import "UIView+frame.h"

#import "LFUser.h"
#import "LFUser+KSCurrent.h"

@interface LFLoginViewController ()
// 登陆页 UI
@property (nonatomic, strong) LFLoginContentView *loginContentView;
// 注册页 UI
@property (nonatomic, strong) LFRegisterContentView *registerContentView;
// 标识页面
@property (nonatomic, assign) BOOL isLoginPage;

@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubViews];
    [self setupButtonAction];
    [self registerForKeyBoardNotification];
}

- (void)dealloc {
    // 移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void)registerForKeyBoardNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSLog(@"[LFDiaryEditViewController]:%s %@", __func__, notification.userInfo);
    NSDictionary *userInfo = notification.userInfo;
    CGSize size = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSTimeInterval duration = [[userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // TODO: 这里的 100 只是临时处理
    [UIView animateWithDuration:duration animations:^{
        if (self.isLoginPage) {
            self.loginContentView.y = -100;
        } else {
            self.registerContentView.y = -100;
        }
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSLog(@"[LFDiaryEditViewController]: %s %@", __func__, notification.userInfo);
    NSDictionary *userInfo = notification.userInfo;
    NSTimeInterval duration = [[userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        if (self.isLoginPage) {
            self.loginContentView.frame = self.view.bounds;
        } else {
            self.registerContentView.frame = self.view.bounds;
        }
    }];
}

#pragma mark - Action Method

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isLoginPage) {
        [self.loginContentView dismissKeyBoard];
    } else {
        [self.registerContentView dismissKeyBoard];
    }
}

- (void)didTaploginBtn:(id)sender {
    // 验证输入格式
    NSString *email = self.loginContentView.email;
    NSString *password = self.loginContentView.password;
    if (!([[LFUser currentUser].email isEqual:email] && [[LFUser currentUser].password isEqual:password])) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"密码错误"
                                                                       message:@"请确认邮箱和密码是否正确"
                                                                preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
            //响应事件
            NSLog(@"action = %@", action);
        }];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        // 发起登陆请求
        // 模仿网络请求
        [LFProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [LFProgressHUD hideHUDForView:self.view animated:YES];
            // 跳转到主页
            LFTabBarController *tabBarController = [[LFTabBarController alloc] init];
            [self dismissViewControllerAnimated:YES completion:^{
                [UIApplication sharedApplication].keyWindow.rootViewController = tabBarController;
            }];
        });
    }
}

- (void)didTapToRegisterPageBtn:(id)sender {
    // 翻转到注册页
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionFlipFromLeft;
    [UIView transitionFromView:self.loginContentView toView:self.registerContentView duration:1 options:options completion:^(BOOL finished) {
        if (finished) {
            self.isLoginPage = NO;
        }
    }];
}

- (void)didTapForgetBtn:(id)sender {
    
}

- (void)didTapRegisterBtn:(id)sender {
    // 检查输入格式
    LFUser *user = [LFUser new];
    user.email = self.registerContentView.email;
    user.nickName = self.registerContentView.nickName;
    user.password = self.registerContentView.password;
    
    // 发送注册请求
    [LFProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LFUser setCurrentUser:user];
        [LFProgressHUD hideHUDForView:self.view animated:YES];
        [self performSelector:@selector(didTapCloseBtn:) withObject:nil];
    });
}

- (void)didTapCloseBtn:(id)sender {
    // 翻转到登陆页
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionFromView:self.registerContentView toView:self.loginContentView duration:1 options:options completion:^(BOOL finished) {
        if (finished) {
            self.isLoginPage = YES;
        }
    }];
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

- (void)setupSubViews {
    self.loginContentView = [[LFLoginContentView alloc] initWithFrame:self.view.bounds];
    self.loginContentView.backgroundColor = [UIColor whiteColor];
    self.registerContentView = [[LFRegisterContentView alloc] initWithFrame:self.view.bounds];
    self.registerContentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginContentView];
    [self.view addSubview:self.registerContentView];
    // 将登陆界面移到最上层
    [self.view bringSubviewToFront:self.loginContentView];
    self.isLoginPage = YES;
}

@end
