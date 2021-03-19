//
//  LFDiaryEditViewController.m
//  life
//
//  Created by liuweihong on 2021/2/25.
//  Copyright © 2021 veggie. All rights reserved.
//

#import "LFDiaryEditViewController.h"
#import "LFDateButton.h"
#import "LFWeatherSelectorView.h"
#import "LFKeyBoardToolBar.h"
#import "LFUIMacro.h"
#import "UIView+frame.h"
#import <Masonry/Masonry.h>

const CGFloat kLRPadding = 16.0f;
const CGFloat kToolBarHeight = 44.0f;

@interface LFDiaryEditViewController () <UITextViewDelegate, LFKeyBoardToolBarDelegate>
// 时间选择按钮
@property (nonatomic, strong) LFDateButton *dateButton;
// 标题输入框
@property (nonatomic, strong) UITextField *titleTextField;
// 天气选择按钮
@property (nonatomic, strong) UIButton *weatherBtn;
// 分割线
@property (nonatomic, strong) UIView *horizontalLine;
// 内容输入框
@property (nonatomic, strong) UITextView *contentTextView;
// UITextView 的 placeHolder
@property (nonatomic, strong) UILabel *placeHolderLabel;
// 键盘弹起后的工具栏
@property (nonatomic, strong) LFKeyBoardToolBar *toolBar;

@end

@implementation LFDiaryEditViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    [self setupLayoutConstrain];
    [self registerForKeyBoardNotification];
}

- (void)dealloc {
    // 移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Public Method


#pragma mark - Notification

//UIKeyboardWillShowNotification
//UIKeyboardDidShowNotification
//UIKeyboardWillHideNotification
//UIKeyboardDidHideNotification

- (void)registerForKeyBoardNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSLog(@"%s %@", __func__, notification.userInfo);
    NSDictionary *userInfo = notification.userInfo;
    CGSize size = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSTimeInterval duration = [[userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:duration animations:^{
        [self.contentTextView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(-(size.height + kToolBarHeight));
        }];
        
        [self.toolBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(-size.height);
        }];
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSLog(@"%s %@", __func__, notification.userInfo);
    NSDictionary *userInfo = notification.userInfo;
    NSTimeInterval duration = [[userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:duration animations:^{
        [self.contentTextView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view);
        }];
        
        [self.toolBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(kToolBarHeight);
        }];
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - LFKeyBoardToolBarDelegate

- (void)didTapUpButton:(LFKeyBoardToolBar *)toolBar {
    [self.titleTextField becomeFirstResponder];
}

- (void)didTapDownButton:(LFKeyBoardToolBar *)toolBar {
    [self.contentTextView becomeFirstResponder];
}

- (void)didTapDoneButton:(LFKeyBoardToolBar *)toolBar {
    [self.titleTextField resignFirstResponder];
    [self.contentTextView resignFirstResponder];
}

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

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.placeHolderLabel.hidden = YES;
    } else {
        self.placeHolderLabel.hidden = NO;
    }
}

#pragma mark - Private Method

- (NSAttributedString *)getAttributedString:(nonnull NSString *)placeholder
                                       font:(nonnull UIFont *)font
                                  textColor:(UIColor *)textColor {
    NSDictionary *attributes = @{
        NSFontAttributeName:font,
        NSForegroundColorAttributeName:textColor
    };
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
    [self.view addSubview:self.placeHolderLabel];
    [self.view addSubview:self.toolBar];
}

- (void)setupLayoutConstrain {
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(kLRPadding);
        make.right.equalTo(self.weatherBtn.mas_left).offset(-kLRPadding);
        make.top.equalTo(self.view.mas_top).offset(StatusBar_NaviBar_Height);
        make.height.equalTo(@60);
    }];
    
    [self.weatherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.centerY.equalTo(self.titleTextField);
        make.right.equalTo(self.view.mas_right).offset(-kLRPadding);
    }];
    
    [self.horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTextField.mas_bottom);
        make.left.equalTo(self.titleTextField);
        make.width.equalTo(self.titleTextField);
        make.height.equalTo(@1);
    }];
    
    [self.contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTextField.mas_bottom).offset(kLRPadding);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(kLRPadding);
        make.right.equalTo(self.view.mas_right).offset(-kLRPadding);
    }];
    
    [self.placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentTextView).offset(5);
        make.top.equalTo(self.contentTextView).offset(7);
    }];
    
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(kToolBarHeight);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(kToolBarHeight));
    }];
}

#pragma mark - Getter Method

- (UITextField *)titleTextField {
    if (!_titleTextField) {
        _titleTextField = [[UITextField alloc] init];
        _titleTextField.font = [UIFont fontWithName:@"STKaiti" size:22.0f];
        _titleTextField.textColor = [UIColor blackColor];
        _titleTextField.attributedPlaceholder = [self getAttributedString:@"标题"
                                                                     font:[UIFont fontWithName:@"STKaiti" size:22.0f]
                                                                textColor:[UIColor blackColor]];
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
        _horizontalLine.backgroundColor = [UIColor clearColor];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor blackColor].CGColor;
        shapeLayer.lineWidth = 1.0f;
        shapeLayer.lineDashPattern = @[@5, @5]; // 设置虚线
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(ScreenWidth - 92, 0)];
        shapeLayer.path = path.CGPath;
        [_horizontalLine.layer addSublayer:shapeLayer];
    }
    return _horizontalLine;
}

- (UITextView *)contentTextView {
    if (!_contentTextView) {
        _contentTextView = [[UITextView alloc] init];
        _contentTextView.font = [UIFont fontWithName:@"STKaiti" size:18.0f];
        _contentTextView.textColor = [UIColor blackColor];
        _contentTextView.backgroundColor = [UIColor greenColor];
        _contentTextView.delegate = self;
    }
    return _contentTextView;
}

- (UILabel *)placeHolderLabel {
    if (!_placeHolderLabel) {
        _placeHolderLabel = [[UILabel alloc] init];
        _placeHolderLabel.backgroundColor = [UIColor clearColor];
        _placeHolderLabel.attributedText = [self getAttributedString:@"说说今天发生了什么事情吧~"
                                                                font:[UIFont fontWithName:@"STKaiti" size:18.0f]
                                                           textColor:[UIColor blackColor]];
    }
    return _placeHolderLabel;
}

- (LFKeyBoardToolBar *)toolBar {
    if (!_toolBar) {
        _toolBar = [[LFKeyBoardToolBar alloc] init];
        _toolBar.backgroundColor = [UIColor redColor];
        _toolBar.delegate = self;
    }
    return _toolBar;
}

@end
