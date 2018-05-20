//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "ArchViewController.h"
#import "FourWordCell.h"
#import "WebViewCell.h"
#import "UserConfig.h"
#import "Literals.h"

#define URL(url_string) ({NSString *path = [[NSBundle mainBundle] pathForResource:url_string ofType:nil];\
 NSURL *url = [NSURL fileURLWithPath:path];\
 url;})

//#define URL(url_string) ({\
// NSURL *url = [[NSBundle mainBundle] URLForResource:url_string withExtension:nil];\
// url;})

@interface ArchViewController ()

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *data;
@end

@implementation ArchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __auto_type tv = [[UITableView alloc]                                               initWithFrame:CGRectMake(0, StatusBar_Height + NavigationBar_Height,
            Screen_Width, Screen_Height - 44 - StatusBar_Height - NavigationBar_Height) style:UITableViewStylePlain];
    [self.view addSubview:tv];
    self.tableView = tv;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;


    [self.tableView registerClass:FourWordCell.class forCellReuseIdentifier:@"kCellIdentify"];
    [self.tableView registerClass:WebViewCell.class forCellReuseIdentifier:@"kCellIdentify1"];


    self.data = @[
            URL(@"jj0.html"),
            URL(@"jj1.html"),
            @"宇宙定甯",
            URL(@"jj2.html"),
            @"至圣孟盖",
            URL(@"jj3.html"),
            @"勑部幼即",
            URL(@"jj4.html"),
            @"读蝀议绩"
    ];

#undef ULR

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 300;
    } else if (indexPath.row % 2 == 1) { // html
        return 200;
    } else if (indexPath.row % 2 == 0) { // words
        return static_cast<CGFloat>(floor((Screen_Width - 5 * 3) / 4)) + 1;
    }
    return 100;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.data[static_cast<NSUInteger>(indexPath.row)] isKindOfClass:NSURL.class]) {
        WebViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellIdentify1" forIndexPath:indexPath];

        cell.url = self.data[static_cast<NSUInteger>(indexPath.row)];

        return cell;
    } else if ([self.data[static_cast<NSUInteger>(indexPath.row)] isKindOfClass:NSString.class]) {

        FourWordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellIdentify" forIndexPath:indexPath];

        cell.textWords = self.data[static_cast<NSUInteger>(indexPath.row)];
        cell.fontName = [UserConfig instance].fontInfo.fontName;
        cell.gridType = [UserConfig instance].gridType;
        cell.color = [UserConfig instance].color;

        return cell;
    }


    return [[UITableViewCell alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
