//
//  ILSettingGroup.h
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILSettingGroup : NSObject

// 头部标题
@property (nonatomic, copy) NSString *header;

// 尾部标题
@property (nonatomic, copy) NSString *footer;

// 一组多少行
@property (nonatomic, strong) NSArray *items;




@end
