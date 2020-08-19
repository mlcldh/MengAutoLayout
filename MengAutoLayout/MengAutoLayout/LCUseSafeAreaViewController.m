//
//  LCUseSafeAreaViewController.m
//  MengAutoLayout
//
//  Created by menglingchao on 2020/7/24.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

#import "LCUseSafeAreaViewController.h"
#import "Masonry.h"

@interface LCUseSafeAreaViewController ()

@end

@implementation LCUseSafeAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addButton];
}
#pragma mark -
- (void)addButton {
    //注意，当前的edgesForExtendedLayout是默认的UIRectEdgeAll，请看看该button的frame
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.backgroundColor = [UIColor purpleColor];
    [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [button setTitle:@"请在刘海屏/非刘海屏上旋转屏幕试试" forState:(UIControlStateNormal)];
//    button.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.mas_topLayoutGuideBottom);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
        }
    }];
//    [self.view.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"menglc self.view.constraints %@", obj);
//    }];
//    [button.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"menglc button.constraints %@", obj);
//    }];
    
//    button.translatesAutoresizingMaskIntoConstraints = NO;
//    if (@available(iOS 11.0, *)) {
//        [NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.view.safeAreaLayoutGuide attribute:(NSLayoutAttributeLeft) multiplier:1 constant:0].active = YES;
//        [NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:self.view.safeAreaLayoutGuide attribute:(NSLayoutAttributeRight) multiplier:1 constant:0].active = YES;
//        [NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:self.view.safeAreaLayoutGuide attribute:(NSLayoutAttributeTop) multiplier:1 constant:0].active = YES;
//        [NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:self.view.safeAreaLayoutGuide attribute:(NSLayoutAttributeBottom) multiplier:1 constant:0].active = YES;
//    } else if (@available(iOS 8.0, *)) {
//        [NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeLeft) multiplier:1 constant:0].active = YES;
//        [NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeRight) multiplier:1 constant:0].active = YES;
//        [NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:self.topLayoutGuide attribute:(NSLayoutAttributeBottom) multiplier:1 constant:0].active = YES;
//        [NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:self.bottomLayoutGuide attribute:(NSLayoutAttributeTop) multiplier:1 constant:0].active = YES;
//    } else if (@available(iOS 7.0, *)) {
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeLeft) multiplier:1 constant:0]];
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeRight) multiplier:1 constant:0]];
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:self.topLayoutGuide attribute:(NSLayoutAttributeBottom) multiplier:1 constant:0]];
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:self.bottomLayoutGuide attribute:(NSLayoutAttributeTop) multiplier:1 constant:0]];
//    }
    
}

@end
