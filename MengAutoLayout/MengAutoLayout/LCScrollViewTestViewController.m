//
//  LCScrollViewTestViewController.m
//  MengAutoLayout
//
//  Created by MengLingChao on 2019/4/26.
//  Copyright © 2019 MengLingChao. All rights reserved.
//

#import "LCScrollViewTestViewController.h"
#import "Masonry.h"

@interface LCScrollViewTestViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;//
@property (nonatomic, strong) UILabel *titleTextView;//标题
@property (nonatomic, strong) UIImageView *avatarImageView;//头像
@property (nonatomic, strong) UILabel *summaryTextView;//概述
@property (nonatomic, strong) UILabel *mainBodyTextView;//正文

@end

@implementation LCScrollViewTestViewController

- (void)dealloc {
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self scrollView];
    [self titleTextView];
    [self avatarImageView];
    [self summaryTextView];
    [self mainBodyTextView];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//    [self.view endEditing:YES];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(self.view);
        }];
    }
    return _scrollView;
}
- (UILabel *)titleTextView {
    if (!_titleTextView) {
        _titleTextView = [[UILabel alloc]init];
        _titleTextView.numberOfLines = 0;
        _titleTextView.font = [UIFont boldSystemFontOfSize:30];
        _titleTextView.text = @"通过协议实现组件化解耦";
        [self.scrollView addSubview:_titleTextView];
        [_titleTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.scrollView).offset(40);
            make.right.equalTo(self.view).offset(-40);
            make.top.equalTo(self.scrollView).offset(20);
        }];
    }
    return _titleTextView;
}
- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar"]];
        [self.view addSubview:_avatarImageView];
        [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleTextView);
            make.top.equalTo(self.titleTextView.mas_bottom).offset(20);
        }];
    }
    return _avatarImageView;
}
- (UILabel *)summaryTextView {
    if (!_summaryTextView) {
        _summaryTextView = [[UILabel alloc]init];
        _summaryTextView.numberOfLines = 0;
        _summaryTextView.font = [UIFont boldSystemFontOfSize:15];
        _summaryTextView.text = @"讲解通过协议实现组件化解耦的直播demo。 现在是将各个组件代码和主工程放到了一个Git工程里，当然实际应该是放到不同Git工程的。";
        [self.scrollView addSubview:_summaryTextView];
        [_summaryTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.scrollView).offset(20);
            make.right.equalTo(self.view).offset(-20);
            make.top.equalTo(self.avatarImageView.mas_bottom).offset(20);
        }];
    }
    return _summaryTextView;
}
- (UILabel *)mainBodyTextView {
    if (!_mainBodyTextView) {
        _mainBodyTextView = [[UILabel alloc]init];
        _mainBodyTextView.numberOfLines = 0;
        _mainBodyTextView.font = [UIFont systemFontOfSize:17];
        _mainBodyTextView.text = @"主工程依赖这些组件。LCLive是主工程。 LCMediator是调度层中间件。 LCBase是基础模块，封装公共类和方法。 LCWeb是h5、weex模块。 LCChat是私信模块。 LCMomment是朋友圈模块。\n中间件是LCMediator，它里面定义了User、私信、Web、Moment等协议，供相应组件实现了和供其他组件调用。\n通过NSClassFromString方法获取到类后，写代码让该类执行类方法时，Xcode不会给提示，毕竟Xcode无法只提供Class这一个类型就判断出具体是那种类。既然不给提示，就要自己将代码复制过去，然后编译也没问题。但如果复制成了其他类方法，只要这个类方法能够引用到，编译就不会报错，这样就会出问题了。这样因为Xcode对类方法编译不够友好，将所有组件协议方法都写成实例方法。\nLCMediator的LCMediatorHeader里通过传入的组件协议返回实现该协议的类的实例。 方法LCModuleInstanceFromProtocol获取到的也就只是实例对象。调用组件协议实例时，不需要提前注册，LCModuleInstanceFromProtocol内部做了懒加载处理。\n优点：\n组件间的调用更为方便。解耦代码量少，实现方便，以后维护也方便。协议方法改变后，编译就会报错，避免代码修改遗漏。协议方法未实现的话，会报编译警告。方法查找容易，调用高效。不需要注册即可调用。\n缺点：\n组件的方法调用分散。内存中维护映射表。协议方法有可能未实现，调用会导致崩溃。\n使用注意事项：组件协议的方法都要写成实例方法，不要写成类方法。组件协议的方法都要实现，因为调用时不会去判断方法有没有实现。获取组件协议实现的实例对象，只能使用LCModuleInstance(module,LCModuleProtocol) 或LCGetModuleInstance(LCModuleProtocol)这两个个宏，从而避免直接使用LCModuleInstanceFromProtocol获取到实现类，让实现类执行了其并不遵守的协议方法。组件协议实现的实例对象只是用来负责组件通信的，不用用它们来存储其他东西，因为这些事例对象一直不会去释放，存储太多东西，容易出现内存占用过多的问题。";
        [self.scrollView addSubview:_mainBodyTextView];
        [_mainBodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.scrollView).offset(20);
            make.right.equalTo(self.view).offset(-20);
            make.top.equalTo(self.summaryTextView.mas_bottom).offset(20);
            make.bottom.lessThanOrEqualTo(self.scrollView).offset(-20);
        }];
    }
    return _mainBodyTextView;
}

@end
