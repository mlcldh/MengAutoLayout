//
//  BaseTableViewCell.m
//  MengTableView
//
//  Created by menglingchao on 16/10/21.
//  Copyright © 2016年 menglingchao. All rights reserved.
//

#import "LCBaseTableViewCell.h"
#import "Masonry.h"

@implementation LCBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundView.backgroundColor = [UIColor purpleColor];
        [self titleLabel];
        [self subtitleLabel];
        [self contentLabel];
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
        _contentLabel.text = @"评论内容，最多140个字。我们在工作中经常会用到KVO，但是系统原生的KVO并不好用，很容易导致Crash。而且编写代码时，需要编写大量KVO相关的代码，由于不支持block的形式，代码会写的很分散。本篇文章对KVO的实现原理进行了详细的分析，并且简单的实现了一个KVO，来当做技术交流。由于系统提供的KVO存在很多问题，在文章的最下面给出了解决方案。";
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subtitleLabel.mas_bottom);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(self.titleLabel);
        }];
    }
    return _contentLabel;
}

@end
