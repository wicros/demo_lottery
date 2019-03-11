//
//  ILScoreTimeViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-15.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILScoreTimeViewController.h"
#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingLabelItem.h"
#import "ILSettingGroup.h"

@interface ILScoreTimeViewController ()
@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, strong) ILSettingLabelItem *startItem;

@end

@implementation ILScoreTimeViewController

- (UIDatePicker *)datePicker
{
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc] init];
        
        // 默认时间
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"HH:mm";
        NSDate *date = [fmt dateFromString:_startItem.text];
        _datePicker.date = date;
        
        // 模式
        _datePicker.datePickerMode = UIDatePickerModeTime;
        // 地区
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
        
        // 监听他的滚动
        [_datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _datePicker;
}

- (void)valueChange:(UIDatePicker *)datePicker
{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    
    _startItem.text = [fmt stringFromDate:datePicker.date];
    
    // 刷新表格
    [self.tableView reloadData];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0组
    [self addGroup0];
    // 1组
    [self addGroup1];
    // 2组
    [self addGroup2];
    
}


- (void)addGroup0
{
    // 0组
    ILSettingItem *notice = [ILSettingSwitchItem itemWithIcon:nil title:@"提醒我关注比赛"];
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.footer = @"当我关注的比赛比分发送变化时，通过小弹窗或推送进行提醒";
    group0.items = @[notice];
    [self.dataLists addObject:group0];
    
    
}

- (void)addGroup1
{
    // 1组
    ILSettingLabelItem *startTime = [ILSettingLabelItem itemWithIcon:nil title:@"开始时间"];
    if (startTime.text.length == 0) { // 没有读取，才需要初始值
        
        startTime.text = @"00:00";
    }
    startTime.option = ^{
        UITextField *temp = [[UITextField alloc] init];
        
        temp.inputView = self.datePicker;
        
        [self.view addSubview:temp];
        
        // 叫出键盘
        [temp becomeFirstResponder];
    
    };
    _startItem = startTime;
    
    ILSettingGroup *group1 = [[ILSettingGroup alloc] init];
    group1.header = @"只在以下时间接受比分直播";
    group1.items = @[startTime];
    [self.dataLists addObject:group1];
    
}
- (void)addGroup2
{
    // 2组
    ILSettingLabelItem *endTime = [ILSettingLabelItem itemWithIcon:nil title:@"结束时间"];
    if (endTime.text.length == 0) { // 没有读取到，才需要初始值
        
        endTime.text = @"00:00";
    }

    
    ILSettingGroup *group2 = [[ILSettingGroup alloc] init];

    group2.items = @[endTime];
    [self.dataLists addObject:group2];
    
}



@end
