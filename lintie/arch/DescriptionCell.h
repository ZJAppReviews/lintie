//
// Created by Away on 2018/5/28.
// Copyright (c) 2018 Away. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DescriptionCell : UITableViewCell
@property(nonatomic, strong) UIView *borderView;

- (void)setTextStr:(NSString *)text;
@end