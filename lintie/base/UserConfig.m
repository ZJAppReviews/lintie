//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "UserConfig.h"
#import "Literals.h"

@interface UserConfig ()
@end

@implementation UserConfig


- (NSArray<NSString *> *)fontNames {

    return @[
            FoneName_JL,
            FoneName_TYZ_XS,
            FoneName_TYZ_KS,
            FoneName_QG_KS
    ];
}

@end