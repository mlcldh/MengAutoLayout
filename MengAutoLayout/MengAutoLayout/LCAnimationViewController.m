//
//  LCAnimationViewController.m
//  MengAutoLayout
//
//  Created by menglingchao on 2020/8/3.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

#import "LCAnimationViewController.h"
#import "Masonry.h"
#import "UIView+MLCKit.h"
#import "UIControl+MLCKit.h"
#import "MLCMacror.h"

@interface LCAnimationViewController ()

@end

@implementation LCAnimationViewController

- (void)dealloc {
    NSLog(@"LCAnimationViewController dealloc");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addButton];
}
#pragma mark -
- (void)addButton {
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.backgroundColor = [UIColor purpleColor];
    [button setTitle:@"button" forState:(UIControlStateNormal)];
    @weakify(self)
    @weakify(button)
    [button mlc_addActionForControlEvents:(UIControlEventTouchUpInside) callback:^(id sender) {
        @strongify(self)
        @strongify(button)
//        {
//            [self.view mlc_removeConstraintsWithFirstItem:button firstAttribute:(NSLayoutAttributeLeft)];
//            [button mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.equalTo(self.view).offset(-50);
//            }];
//        }
        {
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.view).offset(-50);
                make.top.equalTo(self.view).offset(50);
            }];
        }
        
        [UIView animateWithDuration:2 animations:^{
            [self.view layoutIfNeeded];
//            [self.view setNeedsLayout];
        }];
    }];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(50);
    }];
    NSLog(@"menglc self.view.constraints %@", self.view.constraints);
}

@end
