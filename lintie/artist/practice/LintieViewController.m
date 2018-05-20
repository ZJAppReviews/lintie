//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "LintieViewController.h"
#import "WordCell.h"
#import "Literals.h"
#import "UserConfig.h"

@interface LintieViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSString *text;


@end

@implementation LintieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为100*100
    layout.itemSize = CGSizeMake(100, 100);

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                             collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];

    [self.collectionView registerClass:WordCell.class forCellWithReuseIdentifier:@"kCellIdentify"];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;


    self.text = @"天道路酬勤";

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.text.length;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WordCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kCellIdentify" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];

    cell.textLabel.text = [self.text substringWithRange:NSMakeRange((NSUInteger) indexPath.row, 1)];
    cell.fontName = self.fontInfo.fontName;
    cell.gridType = [UserConfig instance].gridType;

    return cell;
}


@end