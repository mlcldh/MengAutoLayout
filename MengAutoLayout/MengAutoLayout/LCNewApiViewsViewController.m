//
//  LCNewApiViewsViewController.m
//  MengAutoLayout
//
//  Created by menglingchao on 2020/8/18.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

#import "LCNewApiViewsViewController.h"

@interface LCNewApiViewsViewController ()

@end

@implementation LCNewApiViewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self useNewApi];
}
#pragma mark - Getter
- (void)useNewApi {
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button1.backgroundColor = [UIColor purpleColor];
    [button1 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [button1 setTitle:@"button1" forState:(UIControlStateNormal)];
    [self.view addSubview:button1];
    if (@available(iOS 9.0, *)) {
        button1.translatesAutoresizingMaskIntoConstraints = NO;
        [button1.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20].active = YES;
        [button1.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;
        [button1.widthAnchor constraintEqualToConstant:100].active = YES;
        [button1.heightAnchor constraintEqualToConstant:50].active = YES;
    }
    
    UIButton *button2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button2.backgroundColor = [UIColor purpleColor];
    [button2 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [button2 setTitle:@"button2" forState:(UIControlStateNormal)];
    [self.view addSubview:button2];
    if (@available(iOS 9.0, *)) {
        button2.translatesAutoresizingMaskIntoConstraints = NO;
        [button2.leftAnchor constraintEqualToAnchor:button1.leftAnchor].active = YES;
        [button2.topAnchor constraintEqualToAnchor:button1.bottomAnchor constant:20].active = YES;
        [button2.widthAnchor constraintEqualToAnchor:button1.widthAnchor multiplier:2].active = YES;
        [button2.heightAnchor constraintEqualToAnchor:button2.widthAnchor multiplier:1].active = YES;
    }
}

@end
