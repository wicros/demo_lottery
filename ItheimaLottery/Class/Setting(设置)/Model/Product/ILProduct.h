//
//  ILProduct.h
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 "title": "网易微博",
 "id": "com.netease.microblogging",
 "url": "http://itunes.apple.com/app/id383629309?mt=8",
 "icon": "newb@2x.png",
 "customUrl": "microblogging"
 
 */

@interface ILProduct : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *schemes; // 协议头
@property (nonatomic, copy) NSString *identifier; // 路径
@property (nonatomic, copy) NSString *url; // 应用下载url
+ (instancetype)productWithDict:(NSDictionary *)dict;

@end
