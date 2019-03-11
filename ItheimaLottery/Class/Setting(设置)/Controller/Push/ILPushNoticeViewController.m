//
//  ILPushNoticeViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-15.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILPushNoticeViewController.h"

#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"

#import "ILTest1ViewController.h"
#import "ILTest2ViewController.h"

#import "ILSettingCell.h"
#import "ILSettingGroup.h"

#import "ILAwardPushViewController.h"
#import "ILAwardAnimViewController.h"
#import "ILScoreTimeViewController.h"

@interface ILPushNoticeViewController ()
//@property (nonatomic, strong) NSMutableArray *dataLists;
@end

@implementation ILPushNoticeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0组
    [self addGroup0];
    
}

- (void)addGroup0
{
    // 0组
    ILSettingItem *push = [ILSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" destVcClass:[ILAwardPushViewController class]];
    ILSettingItem *animation = [ILSettingArrowItem itemWithIcon:nil title:@"中奖动画" destVcClass:[ILAwardAnimViewController class]];
    ILSettingItem *score = [ILSettingArrowItem itemWithIcon:nil title:@"比分直播提醒" destVcClass:[ILScoreTimeViewController class]];
    ILSettingItem *notice = [ILSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒"];
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[push,animation,score,notice];
    [self.dataLists addObject:group0];
    
}


@end
