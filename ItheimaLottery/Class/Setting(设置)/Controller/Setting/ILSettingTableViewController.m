//
//  ILSettingTableViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-13.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILSettingTableViewController.h"


#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"

#import "ILTest1ViewController.h"
#import "ILTest2ViewController.h"

#import "ILSettingCell.h"
#import "ILSettingGroup.h"

#import "MBProgressHUD+MJ.h"

#import "ILProductViewController.h"
#import "ILPushNoticeViewController.h"

#import "ILHelpViewController.h"

#import "ILShareViewController.h"
#import "ILAboutViewController.h"
@interface ILSettingTableViewController ()

@end

@implementation ILSettingTableViewController

- (void)addGroup0
{
    // 0组
    ILSettingItem *morePush = [ILSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[ILPushNoticeViewController class]];
    ILSettingItem *handShake = [ILSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    ILSettingItem *soundEffect = [ILSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[morePush,handShake,soundEffect];
    [self.dataLists addObject:group0];

}
- (void)addGroup1
{
    // 1组
    ILSettingItem *moreUpdate = [ILSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检测新版本" destVcClass:nil];
    // 先保存起来
    moreUpdate.option = ^{
        // 1. 发送请求
        // 2. 弹框,告诉用户当前在做什么
        [MBProgressHUD showMessage:@"正在检测......"];
        
        // 3.模拟请求结果
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 隐藏hud
            [MBProgressHUD hideHUD];
            
            // 再次提示
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新版本2.2" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
            [alertView show];
            //                [MBProgressHUD showError:@"没有新版本"];
        });
        
        NSLog(@"检测版本更新");
        
    };
    ILSettingItem *moreHelp = [ILSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[ILHelpViewController class]];
    ILSettingItem *moreShare = [ILSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[ILShareViewController class]];
    ILSettingItem *moreMessage = [ILSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[ILTest1ViewController class]];
    ILSettingItem *moreNetease = [ILSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[ILProductViewController class]];
    ILSettingItem *moreAbout = [ILSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[ILAboutViewController class]];
    
    ILSettingGroup *group1 = [[ILSettingGroup alloc] init];
    group1.items = @[moreUpdate,moreHelp,moreShare,moreMessage,moreNetease,moreAbout];
    
    [self.dataLists addObject:group1];
}


- (id)init
{
    // 这里不需要做其他的初始化操作，直接返回就好了
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (id)initWithStyle:(UITableViewStyle)style
{

    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.设置标题
    self.title = @"设置";
    // 0组
    [self addGroup0];
    
    // 1组
    [self addGroup1];

    
    
}




@end
