//
// Created by Away on 2018/5/28.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "TitleCell.h"

@interface TitleCell ()
@end

@implementation TitleCell

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

- (void)p_initialize {
    self.textLabel.font = [UIFont boldSystemFontOfSize:50];
    self.textLabel.numberOfLines = 0;
    self.textLabel.textColor = [[UIColor alloc] initWithRed:44 / 255.f green:63 / 255.f blue:81 / 255.f alpha:1];
}

@end