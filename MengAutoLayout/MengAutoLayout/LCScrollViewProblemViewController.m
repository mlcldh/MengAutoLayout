//
//  LCScrollViewProblemViewController.m
//  MengAutoLayout
//
//  Created by menglingchao on 2020/8/3.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

#import "LCScrollViewProblemViewController.h"
#import "Masonry.h"

@interface LCScrollViewProblemViewController ()

@end

@implementation LCScrollViewProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self seeScrollViewProblem];
//    [self solveScrollViewProblem1];
//    [self solveScrollViewProblem2];
    [self solveScrollViewProblem3];
}
#pragma mark -
- (void)seeScrollViewProblem {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor purpleColor];
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    scrollView.contentSize = CGSizeMake(screenSize.width + 200, screenSize.height);
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *boxView = [[UIView alloc]init];
    boxView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:boxView];
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(scrollView);
        make.width.height.mas_equalTo(100);
    }];
}
//基于UIScrollView父视图
- (void)solveScrollViewProblem1 {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor purpleColor];
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    scrollView.contentSize = CGSizeMake(screenSize.width + 200, screenSize.height);
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *boxView = [[UIView alloc]init];
    boxView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:boxView];
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.view);
        make.width.height.mas_equalTo(100);
    }];
}
//直接设置基于UIScrollView的宽度和高度的约束
- (void)solveScrollViewProblem2 {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor purpleColor];
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.height.equalTo(scrollView).offset(200);
    }];
    
    UIView *boxView = [[UIView alloc]init];
    boxView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:boxView];
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(scrollView);
        make.width.height.mas_equalTo(100);
    }];
}
//间接设置基于UIScrollView的宽度和高度的约束
- (void)solveScrollViewProblem3 {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor purpleColor];
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.mas_equalTo(screenSize.width + 200);
        make.height.mas_equalTo(screenSize.height + 200);
    }];
    
    UIView *boxView = [[UIView alloc]init];
    boxView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:boxView];
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(scrollView);
        make.width.height.mas_equalTo(100);
    }];
}

@end
