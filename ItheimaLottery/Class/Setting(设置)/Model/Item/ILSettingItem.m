//
//  ILSettingItem.m
//  ItheimaLottery
//
//  Created by yz on 14-8-13.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILSettingItem.h"

@implementation ILSettingItem



+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    ILSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    
    
    return item;
    
}


@end
