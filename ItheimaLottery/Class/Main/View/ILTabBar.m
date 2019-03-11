//
//  ILTabbar.m
//  ItheimaLottery
//
//  Created by yz on 14-8-11.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILTabBar.h"

#import "ILTabBarButton.h"

// 宏定义 以类名开头
#define ILTabBarButtonCount 5

@interface ILTabBar()

@property (nonatomic, weak) ILTabBarButton *selectedButton;

@end

@implementation ILTabBar



- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName
{
    ILTabBarButton *btn = [ILTabBarButton buttonWithType:UIButtonTypeCustom];
    
    
    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
    btn.tag = self.subviews.count - 1;
    
    // 默认选中第一个
    if (btn.tag == 0) {
        [self btnClick:btn];
    }
}


// 布局子控件方法，调用这个方法之前，自己的frame已经确定好了。
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 遍历按钮布局位置
    for (int i = 0; i < self.subviews.count; i++) {
        
        ILTabBarButton *btn = self.subviews[i];
        CGFloat w = self.bounds.size.width / 5;
        CGFloat h = self.bounds.size.height;
        
        btn.frame = CGRectMake(i * w, 0, w, h);

    }

    
}

- (void)btnClick:(ILTabBarButton *)button
{
    // 1.将之前的按钮取消选中
    _selectedButton.selected = NO;
    
    // 2.选中当前按钮
    button.selected = YES;
    
    // 3.记录选中按钮
    _selectedButton = button;
    
//    // 4.切换控制器
    // 让tabbar控制器切换控制器，是不是应该通知控制器，让控制器切换啊，搞个代理
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectedButtonIndex:)]) {
        [_delegate tabBar:self didSelectedButtonIndex:_selectedButton.tag];
    }
    // 现在就好了吗，是不是还没告诉tabbar谁是它的代理啊，是不是控制器啊，给tabbar设置代理属性
}



@end
