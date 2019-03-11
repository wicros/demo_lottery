//
//  ILSettingArrowItem.h
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILSettingItem.h"

@interface ILSettingArrowItem : ILSettingItem

// 点击这行cell需要跳转的控制器 不是对象类型，不需要管理内存，用assign
// 为什么用Class，因为Class写错类型就会报错.
// 目标控制器的类名
@property (nonatomic, assign) Class destVcClass;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;

@end
