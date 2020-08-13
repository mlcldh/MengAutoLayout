//
//  LCSeeConstraintsViewController.m
//  MengAutoLayout
//
//  Created by menglingchao on 2020/8/3.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

#import "LCSeeConstraintsViewController.h"
#import "Masonry.h"

@interface LCSeeConstraintsViewController ()

@end

@implementation LCSeeConstraintsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self seeConstraints];
}
#pragma mark -
- (void)seeConstraints {
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"button1" forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(50);
        make.width.height.mas_equalTo(100);
    }];
    
    UIButton *button2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button2.backgroundColor = [UIColor purpleColor];
    [button2 setTitle:@"button2" forState:(UIControlStateNormal)];
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button);
        make.top.equalTo(button.mas_bottom).offset(50);
    }];
    
    UIButton *smallButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    smallButton.backgroundColor = [UIColor blueColor];
    [smallButton setTitle:@"smallButton" forState:(UIControlStateNormal)];
    [button2 addSubview:smallButton];
    [smallButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(button);
    }];
    
    [self.view.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"menglc self.view.constraints %@", obj);
    }];
    
    [button.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"menglc button %@, %@", obj, @(button.frame));
    }];
    
    [button2.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"menglc button2 %@, %@", obj, @(button2.frame));
    }];
    
    [smallButton.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"menglc smallButton %@, %@", obj, @(smallButton.frame));
    }];
    NSLog(@"menglc wait 。。。😈😈😈😈😈😈");
    dispatch_async(dispatch_get_main_queue(), ^{//此时会发现，button、button2、smallButton的frame都更新了，自身控件的约束也看到了
        [button.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"menglc button 2 %@, %@", obj, @(button.frame));
        }];
        
        [button2.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"menglc button2 2 %@, %@", obj, @(button2.frame));
        }];
        
        [smallButton.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"menglc smallButton 2 %@, %@", obj, @(smallButton.frame));
        }];
    });
}

@end
