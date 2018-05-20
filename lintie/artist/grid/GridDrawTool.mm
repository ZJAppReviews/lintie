//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "GridDrawTool.h"

@interface GridDrawTool ()
@end

@implementation GridDrawTool

/// TODO: UIScreen scale adopt

+ (void)drawRectWithCxt:(CGContextRef)cxt rect:(CGRect)rect dash:(BOOL)dash color:(UIColor *)color {

    CGContextSaveGState(cxt);

    CGContextSetStrokeColorWithColor(cxt, color ? color.CGColor : UIColor.blackColor.CGColor);


    CGContextSetLineWidth(cxt, 1);

    CGPoint point1 = CGPointMake(rect.origin.x, rect.origin.y);
    CGPoint point2 = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y);
    CGPoint point3 = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGPoint point4 = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height);

    CGContextMoveToPoint(cxt, point1.x, point1.y);
    CGContextAddLineToPoint(cxt, point2.x, point2.y);
    CGContextAddLineToPoint(cxt, point3.x, point3.y);
    CGContextAddLineToPoint(cxt, point4.x, point4.y);
    CGContextClosePath(cxt);

    if (dash) {
        /// ratio
        CGFloat arr[] = {6, 3};

        CGContextSetLineDash(cxt, 0, arr, 2);
    }

    CGContextDrawPath(cxt, kCGPathStroke);

    CGContextRestoreGState(cxt);
}


+ (void)drawDashLineWithCxt:(CGContextRef)cxt fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint dash:(BOOL)dash color:(UIColor *)color {
    CGContextSaveGState(cxt);

    CGContextSetStrokeColorWithColor(cxt, color ? color.CGColor : [UIColor blackColor].CGColor);

    CGContextSetLineWidth(cxt, 1);
    CGContextMoveToPoint(cxt, fromPoint.x, fromPoint.y);

    CGContextAddLineToPoint(cxt, toPoint.x, toPoint.y);

    if (dash) {
        CGFloat arr[] = {6, 3};
        CGContextSetLineDash(cxt, 0, arr, 2);
    }

    CGContextDrawPath(cxt, kCGPathStroke);

    CGContextRestoreGState(cxt);
}

@end

@implementation GridDrawTool (Grid)


+ (void)drawTianWithCxt:(CGContextRef)cxt rect:(CGRect)rect color:(UIColor *)color {

    [self drawRectWithCxt:cxt rect:rect dash:NO color:color];
    [self drawShiZi:cxt rect:rect color:color];


}

+ (void)drawShiZi:(CGContextRef)cxt rect:(CGRect)rect color:(UIColor *)color {
    // 直线
    CGPoint fp2 = CGPointMake(rect.origin.x, rect.origin.y + (rect.size.height) / 2);
    CGPoint tp2 = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + (rect.size.height) / 2);
    [self drawDashLineWithCxt:cxt fromPoint:fp2 toPoint:tp2 dash:YES color:color];

    CGPoint fp3 = CGPointMake(rect.origin.x + (rect.size.width) / 2, rect.origin.y);
    CGPoint tp3 = CGPointMake(rect.origin.x + (rect.size.width) / 2, rect.origin.y + rect.size.height);
    [self drawDashLineWithCxt:cxt fromPoint:fp3 toPoint:tp3 dash:YES color:color];
}

+ (void)drawMiWithCxt:(CGContextRef)cxt rect:(CGRect)rect color:(UIColor *)color {
    [self drawRectWithCxt:cxt rect:rect dash:NO color:color];

    // 斜线
    CGPoint fp = CGPointMake(rect.origin.x, rect.origin.y);
    CGPoint tp = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    [self drawDashLineWithCxt:cxt fromPoint:fp toPoint:tp dash:YES color:color];

    CGPoint fp1 = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height);
    CGPoint tp1 = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y);
    [self drawDashLineWithCxt:cxt fromPoint:fp1 toPoint:tp1 dash:YES color:color];

    [self drawShiZi:cxt rect:rect color:color];

}

+ (void)drawKouWithCxt:(CGContextRef)cxt rect:(CGRect)rect color:(UIColor *)color {
    [self drawRectWithCxt:cxt rect:rect dash:NO color:color];
}


@end