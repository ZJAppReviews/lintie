//
//  ViewController.m
//  lintie
//
//  Created by Away on 2018/5/20.
//  Copyright © 2018 Away. All rights reserved.
//

#import "ViewController.h"
#import "GridDrawTool.h"

@interface TestView : UIView
@end

@implementation TestView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];


    [GridDrawTool drawMiWithCxt:UIGraphicsGetCurrentContext() rect:CGRectMake(19.33, 20, 40, 40) color:nil];

    [GridDrawTool drawTianWithCxt:UIGraphicsGetCurrentContext() rect:CGRectMake(19.33, 70, 40, 40) color:nil];
}


@end
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __auto_type testView = [[TestView alloc] init];
    testView.frame = self.view.frame;
    testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:testView];
}





@end
