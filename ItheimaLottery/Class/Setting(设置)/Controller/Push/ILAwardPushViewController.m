//
//  ILAwardPushViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-15.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILAwardPushViewController.h"
#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingGroup.h"
@interface ILAwardPushViewController ()

@end

@implementation ILAwardPushViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 0组
    [self addGroup0];
    
}

- (void)addGroup0
{
    // 0组
    ILSettingItem *ball = [ILSettingSwitchItem itemWithIcon:nil title:@"双色球"];
    ILSettingItem *letou = [ILSettingSwitchItem itemWithIcon:nil title:@"比分直播提醒"];
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.header = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    group0.items = @[ball,letou];
    [self.dataLists addObject:group0];
    
}


@end
