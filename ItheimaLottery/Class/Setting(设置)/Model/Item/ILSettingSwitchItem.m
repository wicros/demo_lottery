//
//  ILSettingSwitchItem.m
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILSettingSwitchItem.h"

#import "ILSettingTool.h"

@implementation ILSettingSwitchItem

- (void)setOff:(BOOL)off
{
    _off = off;
    
    [ILSettingTool setBool:off forKey:self.title];
}

- (void)setTitle:(NSString *)title
{
    // 这里不能拿到_title赋值，只能调用父类的set方法赋值
    [super setTitle:title];
    
    _off = [ILSettingTool boolForKey:self.title];
    
}


@end
