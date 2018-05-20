//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridDrawTool.h"


@interface FourWordCell : UITableViewCell

@property (nonatomic, copy) NSString *textWords;

@property (nonatomic, assign) GridType gridType;

@property (nonatomic, copy) NSString *fontName;

@property (nonatomic, strong) UIColor *color;

@end