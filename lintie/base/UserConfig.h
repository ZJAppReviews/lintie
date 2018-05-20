//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GridDrawTool.h"

@interface FontInfo : NSObject

@property(nonatomic, strong) NSString *fontName;

@property(nonatomic, strong) NSString *fontLabel;

- (instancetype)initWithFontName:(NSString *)fontName fontLabel:(NSString *)fontLabel;

+ (instancetype)infoWithFontName:(NSString *)fontName fontLabel:(NSString *)fontLabel;

@end

#define FONT_INFO(FONT_NAME, FONT_LABEL) ({ \
    FontInfo *fontInfo = [FontInfo infoWithFontName:FONT_NAME fontLabel:FONT_LABEL];\
    fontInfo;})


@interface UserConfig : NSObject

@property(nonatomic, copy) NSArray<FontInfo *> *fontInfos;

@property(nonatomic, strong) FontInfo *fontInfo;

@property (nonatomic, assign) UIColor *color;

@property (nonatomic, assign) GridType gridType;

+ (UserConfig *)instance;

- (void)changeToNextColor;

- (NSArray<NSString *> *)fontNames;

@end