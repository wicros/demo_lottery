//
//  ILHtml.m
//  ItheimaLottery
//
//  Created by yz on 14-8-17.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILHtml.h"

@implementation ILHtml

+ (instancetype)htmlWithDict:(NSDictionary *)dict
{
    ILHtml *html = [[self alloc] init];

    html.title = dict[@"title"];
    html.html = dict[@"html"];
    html.ID = dict[@"id"];
    
    return html;
 
}

@end
