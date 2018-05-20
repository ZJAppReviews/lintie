//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserConfig : NSObject

@property(nonatomic, copy) NSString *fontName;

- (NSArray<NSString *> *)fontNames;

@end