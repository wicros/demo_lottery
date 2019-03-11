//
//  ILSettingItem.h
//  ItheimaLottery
//
//  Created by yz on 14-8-13.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^ILSettingItemOption)();

@interface ILSettingItem : NSObject

// 文字
@property (nonatomic, strong) NSString *title;

// 图标
@property (nonatomic, strong) NSString *icon;

// 点击对应cell需要做的事情
@property (nonatomic, copy) ILSettingItemOption option;

// 子标题
@property (nonatomic, copy) NSString *subTitle;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;




@end
