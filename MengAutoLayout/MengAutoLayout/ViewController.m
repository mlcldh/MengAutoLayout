//
//  ViewController.m
//  MengAutoLayout
//
//  Created by MengLingChao on 2019/4/17.
//  Copyright © 2019 MengLingChao. All rights reserved.
//

#import "ViewController.h"
//#import "LCTextViewTestViewController.h"
//#import "LCScrollViewTestViewController.h"
//#import "LCTableViewTestViewController.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *titles;//
@property (nonatomic,strong) UITableView *tableView;//

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页列表";
    [self tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"UITextView根据内容自适应高度", @"UIScrollView问题", @"UIScrollView contentSize根据子视图确定", @"UITableViewCell自适应高度", @"查看约束", @"动画", @"安全区域", @"基于其他视图宽高比例的约束", @"批量布局子视图", @"批量连接视图"];
    }
    return _titles;
}
- (UITableView *)tableView {
    if (! _tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        //        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
//        _tableView.backgroundColor = [UIColor purpleColor];
        _tableView.estimatedRowHeight = 44.0f;
        //        _tableView.rowHeight = UITableViewAutomaticDimension;
        //        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
//        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
//            if (@available(iOS 11.0, *)) {
//                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
//            } else {
//                make.top.equalTo(self.mas_topLayoutGuideBottom);
//            }
        }];
    }
    return _tableView;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    static NSArray *vcClassNames = nil;
    if (!vcClassNames) {
        vcClassNames = @[@"LCTextViewTestViewController", @"LCScrollViewProblemViewController", @"LCScrollViewTestViewController", @"LCTableViewTestViewController", @"LCSeeConstraintsViewController", @"LCAnimationViewController", @"LCUseSafeAreaViewController", @"LCSizeMultiplierViewController", @"MengDistributeViewsViewController", @"MengCombineViewsViewController"];
    }
    Class class = NSClassFromString(vcClassNames[indexPath.row]);
    UIViewController *vc = [[class alloc]init];
    vc.title = vcClassNames[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
//        cell.contentView.backgroundColor = [UIColor cyanColor];
    }
    cell.textLabel.text = self.titles[indexPath.row];//
    
    return cell;
}

@end
