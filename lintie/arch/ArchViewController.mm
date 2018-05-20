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

#define Data(s) ({NSString *format = @"<!DOCTYPE html>\n"\
"<html>\n"\
"<head><title>间架结构摘要九十二法</title>\n"\
"    <meta charset='utf-8'>\n"\
"    <link href='https://dn-maxiang.qbox.me/res-min/themes/marxico.css' rel='stylesheet'>\n"\
"    <style></style>\n"\
"</head>\n"\
"<body>\n"\
"<div id='preview-contents' class='note-content'>\n"\
"    <blockquote>\n"\
"        <p>%@</p>\n"\
"    </blockquote>\n"\
"    <hr>\n"\
"</div>\n"\
"</body>\n"\
"</html>";\
NSString *string = [NSString stringWithFormat:format, s];\
NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];\
data;})


//#define URL(url_string) ({\
// NSURL *url = [[NSBundle mainBundle] URLForResource:url_string withExtension:nil];\
// url;})

@interface ArchViewController ()

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *data;
@end

// TODO: webview 加载 滑动卡顿
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
            Data(@"天覆者, 凡画皆帽于其下"), @"宇宙定甯",
            Data(@"地载者, 有画皆托于其上"), @"至孟圣蓋",
            Data(@"让左者, 左昂右低"), @"勅部幼即",
            Data(@"让右者, 右伸左缩"), @"读谏议绩",
            Data(@"横担者, 中画宜长"), @"喜吾娄安",
            Data(@"直卓者, 中竖宜正"), @"甲平干午",
            Data(@"勾拿法其身不宜曲短"), @"葡萄蜀葛",
            Data(@"勾衂法不可直长其势"), @"句勺匀勿",
            Data(@"画短撇长 横短撇长"), @"左在尤龙",
            Data(@"画长撇短 横长撇短"), @"右有厷灰",
            Data(@"画短直长，撇捺宜伸"), @"木本朱东",
            Data(@"画长直短，撇捺宜缩"), @"乐棐筑集",
            Data(@"横长直短"), @"十上下士",
            Data(@"横短直长"), @"才斗丰井",
            Data(@"上下有画，须上短而下长"), @"丕正亚并",
            Data(@"左右有直，须左收而右展"), @"目自因固",
            Data(@"左撇右直，须左缩而右垂"), @"川升邦",
            Data(@"左直右撇，宜左敛而右放"), @"伊侈修",
            Data(@"点复者，宜偃仰向背以求变"), @"亦赤然",
            Data(@"画重者，宜鳞羽参差以化极"), @"三冉册聿",
            Data(@"两平者，左右宜均"), @"颜顾騵",
            Data(@"三合者，中间务正"), @"御谢树",
            Data(@"两段者，上下平分中微加饶减"), @"需留",
            Data(@"三联者，头尾伸缩间仍要停匀"), @"章意素累",
            Data(@"左边小者齐其上"), @"吸呼峰峻",
            Data(@"右边少者齐其下"), @"和知细佃",
            Data(@"外四叠者，体格必整方"), @"嚣器",
            Data(@"内四叠者，布置宜匀密"), @"爽爾",
            Data(@"斜勒者，不宜平平则失势"), @"七也乜此",
            Data(@"平勒者，不宜倚倚则无仪"), @"云去且旦",
            Data(@"纵捺之字，必要攒头收尾"), @"丈尺史又",
            Data(@"纵戈之法，最忌力弱身弯"), @"武成或",
            Data(@"横戈不厌曲"), @"恩息必志",
            Data(@"伸勾贵抱持"), @"勉旭抛",
            Data(@"承上之人，正中为贵"), @"天父外文",
            Data(@"屈勾之势，退缩斯宜"), @"鸠辉",
            Data(@"马齿法其拏钩之锋注射四点之半"), @"鸟马",
            Data(@"上平之字，宜齐首"), @"师明既野",
            Data(@"下平之字，宜齐足"), @"朝故辰",
            Data(@"重捺者，须有缩有伸"), @"变谈茶黍",
    ];

#undef ULR

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 280;
    } else if (indexPath.row % 2 == 1) { // html
        return 150;
    } else if (indexPath.row % 2 == 0) { // words
        return static_cast<CGFloat>(floor((Screen_Width - 5 * 3) / 4)) + 1;
    }
    return 100;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([self.data[static_cast<NSUInteger>(indexPath.row)] isKindOfClass:NSData.class]) {
        WebViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellIdentify1" forIndexPath:indexPath];

        cell.data = self.data[static_cast<NSUInteger>(indexPath.row)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    } else if ([self.data[static_cast<NSUInteger>(indexPath.row)] isKindOfClass:NSURL.class]) {
        WebViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellIdentify1" forIndexPath:indexPath];

        cell.url = self.data[static_cast<NSUInteger>(indexPath.row)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    } else if ([self.data[static_cast<NSUInteger>(indexPath.row)] isKindOfClass:NSString.class]) {

        FourWordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellIdentify" forIndexPath:indexPath];

        cell.textWords = self.data[static_cast<NSUInteger>(indexPath.row)];
        cell.fontName = [UserConfig instance].fontInfo.fontName;
        cell.gridType = [UserConfig instance].gridType;
        cell.color = [UserConfig instance].color;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }


    return [[UITableViewCell alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
