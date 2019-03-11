//
//  ILSettingTool.h
//  ItheimaLottery
//
//  Created by yz on 14-8-16.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILSettingTool : NSObject

// 归档文字
+ (id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(id)value forKey:(NSString *)defaultName;


// 归档开关
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
+ (BOOL)boolForKey:(NSString *)defaultName;
@end
