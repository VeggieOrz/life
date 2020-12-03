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
}


@end
