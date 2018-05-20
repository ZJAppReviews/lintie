//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "EditViewController.h"

@class FontInfo;


@interface LinTieViewController : BaseViewController <EditViewControllerDelegate>

@property (nonatomic, strong) FontInfo *fontInfo;

@end