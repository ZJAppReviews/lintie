//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "WordCell.h"
#import "GridDrawTool.h"

@interface WordCell ()

@end

@implementation WordCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
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
    UILabel *label = [[UILabel alloc] init];
    label.frame = self.bounds;
    [self.contentView addSubview:label];

    self.textLabel = label;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (self.gridType == GridTypeMi) {
        [GridDrawTool drawMiWithCxt:UIGraphicsGetCurrentContext() rect:self.bounds color:nil];
    } else if (self.gridType == GridTypeTian) {
        [GridDrawTool drawTianWithCxt:UIGraphicsGetCurrentContext() rect:self.bounds color:nil];
    }
}

- (void)setFontName:(NSString *)fontName {
    _fontName = [fontName mutableCopy];

    self.textLabel.font = [UIFont fontWithName:fontName size:self.textLabel.frame.size.width];
}


@end