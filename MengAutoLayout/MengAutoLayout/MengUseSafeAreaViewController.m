//
//  MengUseSafeAreaViewController.m
//  MengAutoLayout
//
//  Created by menglingchao on 2020/7/24.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

#import "MengUseSafeAreaViewController.h"
#import "Masonry.h"

@interface MengUseSafeAreaViewController ()

@end

@implementation MengUseSafeAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addBoxView];
}
#pragma mark -
- (void)addBoxView {
    UIView *boxView = [[UIView alloc]init];
    boxView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:boxView];
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
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
}

@end
