//
//  LCTextViewTestViewController.m
//  MengAutoLayout
//
//  Created by MengLingChao on 2019/4/26.
//  Copyright © 2019 MengLingChao. All rights reserved.
//

#import "LCTextViewTestViewController.h"
#import "Masonry.h"

@interface LCTextViewTestViewController ()

@property (nonatomic, strong) UITextView *textView;//

@end

@implementation LCTextViewTestViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self textView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];//键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]init];
        _textView.backgroundColor = [UIColor yellowColor];
        _textView.scrollEnabled = NO;
        _textView.text = @"我问电风扇我丑不丑,结果它摇了一个晚上的头。老司机带带我我要上昆明啊，老司机带带我我要进省城，要上昆明车子多，半路短我为什么。";
        [self.view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.right.equalTo(self.view).offset(-20);
            make.bottom.equalTo(self.view).offset(-20);
        }];
    }
    return _textView;
}
#pragma mark - UIKeyboardWillShowNotification
- (void)handleKeyboardWillShowNotification:(NSNotification *)notification {
    CGFloat keyboardHeight = CGRectGetHeight([notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue]);
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(self.view).offset(- keyboardHeight - 20);
    }];
}
#pragma mark - UIKeyboardWillHideNotification
- (void)handleKeyboardWillHideNotification:(NSNotification *)notification {
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
    }];
}

@end
