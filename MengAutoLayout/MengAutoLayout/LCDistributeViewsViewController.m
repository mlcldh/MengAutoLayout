//
//  LCDistributeViewsViewController.m
//  MengAutoLayout
//
//  Created by menglingchao on 2020/8/7.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

#import "LCDistributeViewsViewController.h"
#import "Masonry.h"

@interface LCDistributeViewsViewController ()

@end

@implementation LCDistributeViewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self useDistributeViewsWithFixedSpacing];
    [self useDistributeViewsWithFixedItemLength];
}
#pragma mark - Getter
- (NSArray<UIButton *> *)buttons {
    NSMutableArray *buttons = [NSMutableArray array];
    
    NSArray<NSString *> *titles = @[@"中国", @"美国", @"津巴布韦", @"加拿大"];
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        button.backgroundColor = [UIColor purpleColor];
        [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [button setTitle:obj forState:(UIControlStateNormal)];
        [buttons addObject:button];
    }];
    
    return buttons;
}
#pragma mark -
- (void)useDistributeViewsWithFixedSpacing {
    NSArray<UIButton *> *buttons = [self buttons];
    [buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.view addSubview:obj];
    }];
    
    [buttons mas_distributeViewsAlongAxis:(MASAxisTypeHorizontal) withFixedSpacing:20 leadSpacing:40 tailSpacing:40];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
    }];
}
- (void)useDistributeViewsWithFixedItemLength {
    NSArray<UIButton *> *buttons = [self buttons];
    [buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.view addSubview:obj];
    }];
    
    [buttons mas_distributeViewsAlongAxis:(MASAxisTypeHorizontal) withFixedItemLength:70 leadSpacing:40 tailSpacing:40];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(150);
    }];
}

@end
