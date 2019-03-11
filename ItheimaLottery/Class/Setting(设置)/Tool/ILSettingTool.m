//
//  ILSettingTool.m
//  ItheimaLottery
//
//  Created by yz on 14-8-16.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILSettingTool.h"

#define ILUserDefaults [NSUserDefaults standardUserDefaults]

@implementation ILSettingTool


// 归档文字
+ (id)objectForKey:(NSString *)defaultName
{
    return [ILUserDefaults objectForKey:defaultName];
}
+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [ILUserDefaults setObject:value forKey:defaultName];
    // 同步数据
    [ILUserDefaults synchronize];
}


// 归档开关
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [ILUserDefaults setBool:value forKey:defaultName];
    [ILUserDefaults synchronize];
}
+ (BOOL)boolForKey:(NSString *)defaultName
{
  return [ILUserDefaults boolForKey:defaultName];
}


@end
