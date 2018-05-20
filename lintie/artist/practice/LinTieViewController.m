//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "LinTieViewController.h"
#import "WordCell.h"
#import "Literals.h"
#import "UserConfig.h"

@interface LinTieViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIToolbar *toolBar;

@property (nonatomic, strong) NSString *text;

@end

@implementation LinTieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    layout.scrollDirection = UICollectionViewScrollDirectionVertical;

    CGFloat edge = (CGFloat) floor((Screen_Width - 5 * 3) / 4);
    layout.itemSize = CGSizeMake(edge, edge);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;


    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                             collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];

    [self.collectionView registerClass:WordCell.class forCellWithReuseIdentifier:@"kCellIdentify"];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;


    self.text = @"天道酬勤";

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 60, Screen_Width, 60)];
    __auto_type items = @[
            [[UIBarButtonItem alloc] initWithTitle:@"颜色" style:UIBarButtonItemStylePlain target:self action:@selector(actionChangeColor:)],
            [[UIBarButtonItem alloc] initWithTitle:@"无格" style:UIBarButtonItemStylePlain target:self action:@selector(actionNoGrid:)],
            [[UIBarButtonItem alloc] initWithTitle:@"田字格" style:UIBarButtonItemStylePlain target:self action:@selector(actionTianGrid:)],
            [[UIBarButtonItem alloc] initWithTitle:@"米字格" style:UIBarButtonItemStylePlain target:self action:@selector(actionMiGrid:)]
    ];
    [toolbar setItems:items];
    [self.view addSubview:toolbar];
}

- (void)actionChangeColor:(id)sender {
    [[UserConfig instance] changeToNextColor];
    [self.collectionView reloadData];
}

- (void)actionNoGrid:(id)sender {
    if ([UserConfig instance].gridType != GridTypeNone) {
        [UserConfig instance].gridType = GridTypeNone;
        [self.collectionView reloadData];
    }
}


- (void)actionTianGrid:(id)sender {
    if ([UserConfig instance].gridType != GridTypeTian) {
        [UserConfig instance].gridType = GridTypeTian;
        [self.collectionView reloadData];
    }
}

- (void)actionMiGrid:(id)sender {
    if ([UserConfig instance].gridType != GridTypeMi) {
        [UserConfig instance].gridType = GridTypeMi;
        [self.collectionView reloadData];
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.text.length;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WordCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kCellIdentify" forIndexPath:indexPath];

//    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];

    cell.textLabel.text = [self.text substringWithRange:NSMakeRange((NSUInteger) indexPath.row, 1)];
    cell.fontName = self.fontInfo.fontName;
    cell.gridType = [UserConfig instance].gridType;
    cell.textLabel.textColor = [UserConfig instance].color;

    return cell;
}


@end