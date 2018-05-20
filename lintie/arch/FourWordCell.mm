//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "FourWordCell.h"
#import "GridDrawTool.h"
#import "Literals.h"

@interface FourWordCell ()
@property(nonatomic, strong) NSArray<UILabel *> *labels;
@end

@implementation FourWordCell


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
    CGFloat width = (Screen_Width - 5 * 3) / 4;
    CGFloat height = (Screen_Width - 5 * 3) / 4;

    CGRect frames[] = {
            CGRectMake(0, 0, width, height),
            CGRectMake(width * 1 + 5 * 1, 0, width, height),
            CGRectMake(width * 2 + 5 * 2, 0, width, height),
            CGRectMake(width * 3 + 5 * 3, 0, width, height),
    };

    NSMutableArray *labels = [@[] mutableCopy];
    for (int i = 0; i < 4; i++) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc] init];
        label.frame = frames[i];
        [self.contentView addSubview:label];
        [labels addObject:label];
    }

    self.labels = labels;

}

- (void)setTextWords:(NSString *)textWords {
    _textWords = [textWords mutableCopy];
    int len = (int)_textWords.length;

    for (int i = 0; (i < 4 && i < len); i++) {

        NSString *w = [textWords substringWithRange:NSMakeRange(static_cast<NSUInteger>(i), 1)];
        self.labels[static_cast<NSUInteger>(i)].text = w;
    }
}

- (void)setColor:(UIColor *)color {
    _color = color;

    for (int i = 0; i < 4; i++) {

        self.labels[static_cast<NSUInteger>(i)].textColor = color;
    }
}

- (void)setFontName:(NSString *)fontName {
    _fontName = [fontName mutableCopy];

    for (int i = 0; i < 4; i++) {

        self.labels[static_cast<NSUInteger>(i)].font = [UIFont fontWithName:fontName
                                                                       size:self.labels[static_cast<NSUInteger>(i)].frame.size.width];;
    }
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGFloat width = (Screen_Width - 5 * 3) / 4;
    CGFloat height = (Screen_Width - 5 * 3) / 4;

    CGRect frames[] = {
            CGRectMake(0, 0, width, height),
            CGRectMake(width * 1 + 5 * 1, 0, width, height),
            CGRectMake(width * 2 + 5 * 2, 0, width, height),
            CGRectMake(width * 3 + 5 * 3, 0, width, height),
    };
    for (int i = 0; i < 4; i++) {
        if (self.gridType == GridTypeMi) {
            [GridDrawTool drawMiWithCxt:UIGraphicsGetCurrentContext() rect:frames[i] color:nil];
        } else if (self.gridType == GridTypeTian) {
            [GridDrawTool drawTianWithCxt:UIGraphicsGetCurrentContext() rect:frames[i] color:nil];
        } else if (self.gridType == GridTypeKou) {
            [GridDrawTool drawKouWithCxt:UIGraphicsGetCurrentContext() rect:frames[i] color:nil];
        }
    }
}

@end
