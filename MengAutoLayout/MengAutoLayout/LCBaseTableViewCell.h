//
//  BaseTableViewCell.h
//  MengTableView
//
//  Created by menglingchao on 16/10/21.
//  Copyright © 2016年 menglingchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCBaseTableViewCell : UITableViewCell

/***/
@property (nonatomic,strong) UILabel *titleLabel;
/***/
@property (nonatomic,strong) UILabel *subtitleLabel;
/***/
@property (nonatomic,strong) UILabel *contentLabel;
/***/
@property (nonatomic,strong) UITextView *textView;

@end
