//
//  LCTableViewTestViewController.m
//  MengAutoLayout
//
//  Created by MengLingChao on 2019/4/26.
//  Copyright © 2019 MengLingChao. All rights reserved.
//

#import "LCTableViewTestViewController.h"
#import "LCBaseTableViewCell.h"
#import "Masonry.h"

@interface LCTableViewTestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;//
@property (nonatomic,strong) NSMutableArray *titles;//

@end

@implementation LCTableViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableView];
    [self logSomething];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (NSMutableArray *)titles {
    if (! _titles) {
        _titles = [NSMutableArray array];
        for (NSInteger i = 0; i < 10; i ++) {
            NSMutableString *title = [NSMutableString string];
            CGFloat random = arc4random() % 50;
            char ch = 'a';
            for (NSInteger j = 0; j < random; j ++) {
                //                NSLog(@"a%d,z%d",*a,*z);
                char hehe = ch + (arc4random()%26);
                NSString *string = [NSString stringWithFormat:@"%s",&hehe];
                //                NSLog(@"%@",string);
                //                printf("%c",hehe);
                [title appendString:string];
            }
            [_titles addObject:title];
        }
    }
    return _titles;
}
- (UITableView *)tableView {
    if (! _tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.estimatedRowHeight = 44.0f;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}
#pragma mark - Event
- (void)animationButtonAction:(UIButton *)button {
    NSArray *cells = self.tableView.visibleCells;
    CGFloat tableHeight = self.tableView.bounds.size.height;
    for (NSInteger i = 0; i < cells.count; i ++) {
        UITableViewCell *cell = cells[i];
        cell.transform = CGAffineTransformMakeTranslation(0, tableHeight);
        [UIView animateWithDuration:1 delay:0.05 * i usingSpringWithDamping:0.8 initialSpringVelocity:0 options:0 animations:^{
            cell.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
        }];
    }
}
#pragma mark -
- (void)logSomething {
    NSLog(@"menglc tableview %@,%@",UITableViewIndexSearch,@(UITableViewAutomaticDimension));
    NSLog(@"%@,%@",UICollectionElementKindSectionHeader,UICollectionElementKindSectionFooter);
    //NSLog(@"%@",NSStringFromCGSize(UICollectionViewFlowLayoutAutomaticSize));
}
#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    NSLog(@"%s,%@",__FUNCTION__,@(decelerate));
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"%s",__FUNCTION__);
//}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    [tableView setContentOffset:CGPointMake(0, tableView.contentSize.height - tableView.frame.size.height) animated:YES];
    //    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.titles.count - 1 inSection:0] atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
    
    //    NSArray *indexPaths = tableView.indexPathsForVisibleRows;
    //    for (NSInteger i = 0; i < indexPaths.count; i ++) {
    //        NSIndexPath *aIndexPath = indexPaths[i];
    //        NSLog(@"%@",@(aIndexPath.row));
    //    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"取消关注";
}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *actions = [NSMutableArray array];
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"忽略未读" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    [actions addObject:action];
    
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    [actions addObject:action2];
    
    return actions;
    //    return nil;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    LCBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[LCBaseTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    cell.titleLabel.text = self.titles[indexPath.row];
    
    return cell;
}
//- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    return @[@"he"];
//}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
