//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "WebViewCell.h"
#import <WebKit/WebKit.h>

@interface WebViewCell ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation WebViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }

    return self;
}



- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }

    return self;
}

- (void)setupView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.contentView.bounds];
    self.webView.scrollView.scrollEnabled = NO;
    [self.contentView addSubview:webView];
    self.webView = webView;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.webView.frame = self.bounds;
}

- (void)setUrl:(NSURL *)url {
    _url = url;
    if (_url) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
        // scrollView lazy initialize
        self.webView.scrollView.scrollEnabled = NO;
    }
}


- (void)setData:(NSData *)data {
    _data = data;
    if (_data) {
        [self.webView loadHTMLString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
                             baseURL:nil];
        // scrollView lazy initialize
        self.webView.scrollView.scrollEnabled = NO;
    }
}


@end