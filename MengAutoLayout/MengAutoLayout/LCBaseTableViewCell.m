//
//  BaseTableViewCell.m
//  MengTableView
//
//  Created by menglingchao on 16/10/21.
//  Copyright © 2016年 menglingchao. All rights reserved.
//

#import "LCBaseTableViewCell.h"
#import "Masonry.h"
//#import "LCText.h"

@implementation LCBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundView.backgroundColor = [UIColor purpleColor];
        [self titleLabel];
        [self subtitleLabel];
        [self contentLabel];
        [self textView];
    }
    return self;
}

#pragma mark -
- (UILabel *)titleLabel {
    if (! _titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
        }];
    }
    return _titleLabel;
}
- (UILabel *)subtitleLabel {
    if (! _subtitleLabel) {
        _subtitleLabel = [[UILabel alloc]init];
        _subtitleLabel.textColor = [UIColor purpleColor];
        _subtitleLabel.font = [UIFont systemFontOfSize:13];
        _subtitleLabel.numberOfLines = 2;
        _subtitleLabel.text = @"张三的评论，最多显示140个字。这个Label最多显示两行。这个Label最多显示两行。这个Label最多显示两行。这个Label最多显示两行。这个Label最多显示两行。这个Label最多显示两行。";
        [self.contentView addSubview:_subtitleLabel];
        [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(self.titleLabel);
        }];
    }
    return _subtitleLabel;
}
- (UILabel *)contentLabel {
    if (! _contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = [UIColor darkGrayColor];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"评论内容，最多140个字。我们在工作中经常会用到KVO，但是系统原生的KVO并不好用，很容易导致Crash。";
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subtitleLabel.mas_bottom);
//            make.bottom.equalTo(self.contentView).offset(-10);
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(self.titleLabel);
        }];
    }
    return _contentLabel;
}
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]init];
        _textView.backgroundColor = [UIColor systemPinkColor];
        _textView.scrollEnabled = NO;
        _textView.text = @"This is a UITextView";
//        [_textView setLc_textDidChangeBlock:^(NSString * _Nonnull text) {
//            UITableView *tableView = (UITableView *)(self.nextResponder);
////            [tableView reloadData];
////            [tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:(UITableViewRowAnimationNone)];
//        }];
        [self.contentView addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentLabel);
            make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.height.mas_greaterThanOrEqualTo(50);
        }];
    }
    return _textView;
}

@end
