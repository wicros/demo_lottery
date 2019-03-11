//
//  ILSettingLabelItem.m
//  ItheimaLottery
//
//  Created by yz on 14-8-15.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILSettingLabelItem.h"
#import "ILSettingTool.h"

@implementation ILSettingLabelItem

- (void)setText:(NSString *)text
{
    _text = text;
    
    // 不能用_访问，默认是私有的。
    [ILSettingTool setObject:text forKey:self.title];
    
}

- (void)setTitle:(NSString *)title
{
    // 这里不能拿到_title赋值，只能调用父类的set方法赋值
    [super setTitle:title];
    
    _text = [ILSettingTool objectForKey:self.title];
    
}

@end
