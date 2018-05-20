//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "EditViewController.h"
#import "Literals.h"

@interface EditViewController ()
@property(nonatomic, strong) UITextView *textView;
@end

@implementation EditViewController

// TODO: 有修改, 未保存 提示保存

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextView];

    self.title = @"编辑";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(actionSubmit:)];

    self.textView.text = self.text;
    self.textView.font = [UIFont systemFontOfSize:24];
}

- (void)actionSubmit:(id)actionSubmit {
    [self.delegate finishEditWithText:self.textView.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupTextView {
    __auto_type textView = [[UITextView alloc] initWithFrame:CGRectMake(0, NavigationBar_Height + StatusBar_Height + 5 ,
            Screen_Width, Screen_Height - NavigationBar_Height - StatusBar_Height - 5)];
    [self.view addSubview:textView];
    self.textView = textView;
}


@end