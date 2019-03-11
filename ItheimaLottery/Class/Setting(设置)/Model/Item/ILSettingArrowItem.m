//
//  ILSettingArrowItem.m
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILSettingArrowItem.h"

@implementation ILSettingArrowItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    // 注意这里要改成self
    //    ILSettingItem *item = [[ILSettingItem alloc] init];
    ILSettingArrowItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.destVcClass = destVcClass;
    
    return item;
}

@end
