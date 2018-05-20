//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GridType) {
    GridTypeNone,
    GridTypeMi,
    GridTypeTian
};

@interface GridDrawTool : NSObject

+ (void)drawRectWithCxt:(CGContextRef)cxt rect:(CGRect)rect dash:(BOOL)dash color:(UIColor *)color;

+ (void)drawDashLineWithCxt:(CGContextRef)cxt fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint dash:(BOOL)dash color:(UIColor *)color;

@end

@interface GridDrawTool (Grid)

+ (void)drawTianWithCxt:(CGContextRef)cxt rect:(CGRect)rect color:(UIColor *)color;

+ (void)drawMiWithCxt:(CGContextRef)cxt rect:(CGRect)rect color:(UIColor *)color;

@end
