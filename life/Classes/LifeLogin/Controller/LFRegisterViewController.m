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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView = [[LFRegisterContentView alloc] initWithFrame:self.view.bounds];
    self.view = self.contentView;
}

@end
