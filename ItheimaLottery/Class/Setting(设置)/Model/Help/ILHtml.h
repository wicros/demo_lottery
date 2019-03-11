//
//  ILHtml.h
//  ItheimaLottery
//
//  Created by yz on 14-8-17.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 "title" : "如何领奖？",
 "html" : "help.html",
 "id" : "howtoprize"

 
 */

@interface ILHtml : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

+ (instancetype)htmlWithDict:(NSDictionary *)dict;

@end
