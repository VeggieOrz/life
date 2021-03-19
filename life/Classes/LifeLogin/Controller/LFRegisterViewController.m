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



#pragma mark - Priavte Method

- (void)setupButtonAction {
   
}

@end
