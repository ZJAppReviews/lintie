//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "LinTieViewController.h"
#import "WordCell.h"
#import "Literals.h"
#import "UserConfig.h"
#import "EditViewController.h"

@interface LinTieViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic, strong) UIToolbar *toolBar;

@property(nonatomic, strong) NSString *text;

@property (nonatomic, weak) UITextField *textField;

@end

@implementation LinTieViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTextInput];
    [self setupCollectionView];
    [self setupToolBar];
    self.title = self.fontInfo.fontLabel;
    self.textField.text = @"天道酬勤";
    self.text = @"天道酬勤";

}


#pragma mark - Action

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


- (void)actionEdit:(id)actionEdit {
    __auto_type editVC = [[EditViewController alloc] init];
    editVC.text = self.text;
    editVC.delegate = self;

    [self.navigationController pushViewController:editVC animated:YES];
}

- (void)actionShow:(id)actionShow {
    self.text = self.textField.text;
    [self.collectionView reloadData];
}

#pragma mark - EditViewControllerDelegate

- (void)finishEditWithText:(NSString *)text {
    self.text = text;
    self.textField.text = text;
    [self.collectionView reloadData];
}


#pragma mark - UICollectionDelegate

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


#pragma mark - setup UI


- (void)setupTextInput {
    __auto_type textInput = [[UITextField alloc] initWithFrame:CGRectMake(5, NavigationBar_Height + StatusBar_Height + 5, self.view.bounds.size.width - 200, 40)];
    self.textField = textInput;
    textInput.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textInput];

    __auto_type editBtn = [[UIButton alloc] initWithFrame:CGRectMake(5 + self.view.bounds.size.width - 200, NavigationBar_Height + StatusBar_Height + 5, 90, 40)];
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(actionEdit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:editBtn];

    __auto_type showBtn = [[UIButton alloc] initWithFrame:CGRectMake(5 + self.view.bounds.size.width - 200 + 5 + 95, NavigationBar_Height + StatusBar_Height + 5, 90, 40)];
    [showBtn setTitle:@"显示" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(actionShow:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
}


- (void)setupToolBar {
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

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    layout.scrollDirection = UICollectionViewScrollDirectionVertical;

    CGFloat edge = (CGFloat) floor((Screen_Width - 5 * 3) / 4);
    layout.itemSize = CGSizeMake(edge, edge);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,
                    NavigationBar_Height + StatusBar_Height + 5 + 5 + 40, Screen_Width,
                    Screen_Height - 60 - 40 - NavigationBar_Height - StatusBar_Height - 5 - 5)
                                             collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];

    [self.collectionView registerClass:WordCell.class forCellWithReuseIdentifier:@"kCellIdentify"];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

@end