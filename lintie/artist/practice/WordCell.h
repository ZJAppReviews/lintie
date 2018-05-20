//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import <UIKit/UIkit.h>
#import "GridDrawTool.h"


@interface WordCell : UICollectionViewCell

@property (nonatomic, weak) UILabel *textLabel;

@property (nonatomic, assign) GridType gridType;

@property (nonatomic, copy) NSString *fontName;

@end
