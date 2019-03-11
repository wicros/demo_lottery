//
//  ILAwardAnimViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-15.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILAwardAnimViewController.h"
#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingGroup.h"

@interface ILAwardAnimViewController ()

@end

@implementation ILAwardAnimViewController

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
    ILSettingItem *awardAnim = [ILSettingSwitchItem itemWithIcon:nil title:@"中奖动画"];

    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.header = @"当您有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒";
    group0.items = @[awardAnim];
    [self.dataLists addObject:group0];
    
}

@end
