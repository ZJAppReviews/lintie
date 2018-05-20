//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@protocol EditViewControllerDelegate <NSObject>

- (void)finishEditWithText:(NSString *)text;

@end

@interface EditViewController : BaseViewController

@property (nonatomic, copy) NSString *text;
@property (nonatomic, weak) id<EditViewControllerDelegate> delegate;
@end