//
// Created by Away on 2018/5/28.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "DescriptionCell.h"
#import <Masonry/Masonry.h>
@interface DescriptionCell ()

@end

@implementation DescriptionCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self p_initialize];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self p_initialize];
    }

    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(40);
        make.right.offset(-20);
        make.centerY.offset(0);
    }];
}


- (void)p_initialize {
    self.textLabel.textColor = [[UIColor alloc] initWithRed:44 / 255.f green:63 / 255.f blue:81 / 255.f alpha:1];
    self.textLabel.numberOfLines = 0;

    self.borderView = [[UIView alloc] initWithFrame:CGRectZero];
    self.borderView.backgroundColor = [UIColor colorWithRed:102 / 255.f green:108 / 255.f blue:153 / 255.f alpha:0.075];
    [self.contentView addSubview:self.borderView];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(40);
        make.right.offset(-20);
        make.centerY.offset(0);
    }];

    [self.borderView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.offset(10);
       make.width.equalTo(@10);
       make.top.offset(30);
       make.bottom.offset(-30);
    }];
}

- (void)setTextStr:(NSString *)text {
    self.textLabel.text = text;


}
@end