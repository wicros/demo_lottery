//
//  ILProduct.m
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILProduct.h"

@implementation ILProduct

+ (instancetype)productWithDict:(NSDictionary *)dict
{
    ILProduct *p = [[self alloc] init];
//    [p setValuesForKeysWithDictionary:dict];
    p.title = dict[@"title"];
    p.icon = dict[@"icon"];
    p.schemes = dict[@"customUrl"];
    p.identifier = dict[@"id"];
    p.url = dict[@"url"];
    return p;
}

@end
