//
//  ILAboutViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-17.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILAboutViewController.h"
#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingGroup.h"

#import "ILAboutHeaderView.h"

@interface ILAboutViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ILAboutViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 0组
    [self addGroup0];
    
    
    // 设置头部视图
    self.tableView.tableHeaderView = [ILAboutHeaderView aboutHeaderView];
}
- (UIWebView *)webView
{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
    }
    return _webView;
}
- (void)addGroup0
{

    // 0组
    ILSettingItem *mark = [ILSettingArrowItem itemWithIcon:nil title:@"评分支持" destVcClass:nil];
    mark.option = ^{
        NSString *appid = @"635768442";
        
        NSString *str = [NSString stringWithFormat:
                         @"itms-apps://itunes.apple.com/cn/app/id%@?mt=8",appid];
        
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
    };
    ILSettingItem *call = [ILSettingArrowItem itemWithIcon:nil title:@"客服电话" destVcClass:nil];
    call.subTitle = @"020-83568090";
    
    call.option = ^{

        NSURL *url = [NSURL URLWithString:@"tel://10086"];
        UIWebView *webView = [[UIWebView alloc] init];
        [self.view addSubview:webView];
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
//        NSURL *url = [NSURL URLWithString:@"telprompt://10086"];
//        [[UIApplication sharedApplication] openURL:url];
        
    };
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[mark,call];
    
    [self.dataLists addObject:group0];
    
}

@end
