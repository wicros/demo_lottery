//
//  ILTabbar.h
//  ItheimaLottery
//
//  Created by yz on 14-8-11.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILTabBar;

// 协议名称：以自己想关联的类名开头，后接delegate
@protocol ILTabbarDelegate <NSObject>

@optional
// 方法名：以自己开头，作为谁的代理,后面就告诉这个方法是干嘛用的。
- (void)tabBar:(ILTabBar *)tabBar didSelectedButtonIndex:(NSInteger)index;

@end



@interface ILTabBar : UIView

// 自己搞个代理，通知代理做事情
@property (nonatomic, weak) id<ILTabbarDelegate> delegate;

/**
 *  添加一个内部按钮
 *
 *  @param name    按钮图片
 *  @param selName 按钮选中图片
 */
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName;

@end
