//
//  LCSizeMultiplierViewController.m
//  MengAutoLayout
//
//  Created by menglingchao on 2020/8/4.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

#import "LCSizeMultiplierViewController.h"
#import "Masonry.h"

@interface LCSizeMultiplierViewController ()

@end

@implementation LCSizeMultiplierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self useWidthMultiplier];
}
#pragma mark -
- (void)useWidthMultiplier {
    //让视图中心点的处于父视图水平三分之一处
    UIView *boxView = [[UIView alloc]init];
    boxView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:boxView];
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_right).multipliedBy(1 / 3.f);
        make.top.equalTo(self.view).offset(100);
        make.width.height.mas_equalTo(100);
    }];
}

@end
