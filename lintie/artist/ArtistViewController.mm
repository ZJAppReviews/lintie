//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "ArtistViewController.h"
#import "UserConfig.h"
#import "LinTieViewController.h"

@interface ArtistViewController () <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak) UITableView *tableView;

@end

@implementation ArtistViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    __auto_type tv = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tv];
    self.tableView = tv;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"kCellIdentify"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [UserConfig instance].fontInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    __auto_type cell = [tableView dequeueReusableCellWithIdentifier:@"kCellIdentify" forIndexPath:indexPath];
    cell.textLabel.text = [UserConfig instance].fontInfos[static_cast<NSUInteger>(indexPath.row)].fontLabel;
    cell.textLabel.font = [UIFont fontWithName:[UserConfig instance].fontInfos[static_cast<NSUInteger>(indexPath.row)].fontName
                                          size:17];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    LinTieViewController *controller = [[LinTieViewController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    controller.fontInfo = [UserConfig instance].fontInfos[static_cast<NSUInteger>(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];

    [UserConfig instance].fontInfo = controller.fontInfo;
}


@end