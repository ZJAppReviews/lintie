//
//  ViewController.m
//  lintie
//
//  Created by Away on 2018/5/20.
//  Copyright © 2018 Away. All rights reserved.
//

#import "ViewController.h"
#import "GridDrawTool.h"
#import "Literals.h"
#import "LintieViewController.h"

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
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

@implementation ViewController
- (IBAction)button:(id)sender {
    [self presentViewController:[[LintieViewController alloc] init] animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.lab.text = @"田英章";
    self.lab.font = [UIFont fontWithName:FoneName_TYZ_KS size:16];

//    __auto_type testView = [[TestView alloc] init];
//    testView.frame = self.view.frame;
//    testView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:testView];
//
//
    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }



}





@end
