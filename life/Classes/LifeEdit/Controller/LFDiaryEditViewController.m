//
//  LFDiaryEditViewController.m
//  life
//
//  Created by liuweihong on 2021/2/25.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryEditViewController.h"
#import "LFWeatherSelectorView.h"
#import "LFUIMacro.h"
#import <Masonry/Masonry.h>

@interface LFDiaryEditViewController ()
// 标题输入框
@property (nonatomic, strong) UITextField *titleTextField;
// 天气选择按钮
@property (nonatomic, strong) UIButton *weatherBtn;
// 分割线
@property (nonatomic, strong) UIView *horizontalLine;
// 内容输入框
@property (nonatomic, strong) UITextView *contentTextView;

@end

@implementation LFDiaryEditViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    [self setupLayoutConstrain];
}

#pragma mark - Public Method


#pragma mark - Action Method

- (void)didTapWeatherBtn:(id)sender {
    [LFWeatherSelectorView showWithInitIdex:self.weatherBtn.tag
                                touchRemove:YES
                                      block:^(NSInteger index) {
        self.weatherBtn.tag = index;
        NSString *imageName = [NSString stringWithFormat:@"weather_%d", (int)index];
        UIImage *image = [UIImage imageNamed:imageName];
        [self.weatherBtn setBackgroundImage:image forState:UIControlStateNormal];
    }];
}

#pragma mark - Private Method

- (NSAttributedString *)getAttributedString:(NSString *)placeholder
                                       font:(UIFont *)font
                                  textColor:(UIColor *)textColor {
    NSDictionary *attributes = @{};
    NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder
                                                                                attributes:attributes] ;
    return attributedPlaceholder;
}

#pragma mark - UI About

- (void)setupSubViews {
    [self.view addSubview:self.titleTextField];
    [self.view addSubview:self.weatherBtn];
    [self.view addSubview:self.horizontalLine];
    [self.view addSubview:self.contentTextView];
}

- (void)setupLayoutConstrain {
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.weatherBtn.mas_left).offset(-16);
        make.top.equalTo(self.view.mas_top).offset(StatusBar_NaviBar_Height);
        make.height.equalTo(@60);
    }];
    
    [self.weatherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.centerY.equalTo(self.titleTextField);
        make.right.equalTo(self.view.mas_right).offset(-16);
    }];
    
    [self.horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTextField.mas_bottom);
        make.left.equalTo(self.titleTextField);
        make.width.equalTo(self.titleTextField);
        make.height.equalTo(@1);
    }];
    
    [self.contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTextField.mas_bottom).offset(44);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
    }];
}

#pragma mark - Getter Method

- (UITextField *)titleTextField {
    if (!_titleTextField) {
        _titleTextField = [[UITextField alloc] init];
        _titleTextField.font = [UIFont fontWithName:@"STKaiti" size:22.0f];
        _titleTextField.textColor = [UIColor blackColor];
//        _titleTextField.backgroundColor = [UIColor redColor];
        _titleTextField.attributedPlaceholder = nil;
    }
    return _titleTextField;
}

- (UIButton *)weatherBtn {
    if (!_weatherBtn) {
        _weatherBtn = [[UIButton alloc] init];
        _weatherBtn.tag = 0;
        UIImage *image = [UIImage imageNamed:@"weather_0"];
        [_weatherBtn setBackgroundImage:image forState:UIControlStateNormal];
        [_weatherBtn addTarget:self action:@selector(didTapWeatherBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _weatherBtn;
}

- (UIView *)horizontalLine {
    if (!_horizontalLine) {
        _horizontalLine = [[UIView alloc] init];
        _horizontalLine.backgroundColor = [UIColor blackColor];
    }
    return _horizontalLine;
}

- (UITextView *)contentTextView {
    if (!_contentTextView) {
        _contentTextView = [[UITextView alloc] init];
        _contentTextView.font = [UIFont fontWithName:@"STKaiti" size:18.0f];
        _contentTextView.textColor = [UIColor blackColor];
        _contentTextView.backgroundColor = [UIColor greenColor];
    }
    return _contentTextView;
}

@end
