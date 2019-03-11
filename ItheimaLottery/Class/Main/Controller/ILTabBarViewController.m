//
//  ILTabBarViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-12.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILTabBarViewController.h"

#import "ILTabBar.h"

#import "ILTabBarButton.h"



@interface ILTabBarViewController ()<ILTabbarDelegate>

@end

@implementation ILTabBarViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    return;
    
    
    ILTabBar *tabBar = [[ILTabBar alloc] init];
    tabBar.delegate = self;
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor redColor];
    [self.tabBar addSubview:tabBar];
    
    
    // 遍历子控件添加按钮
    for (int i = 0; i < self.viewControllers.count; i++) {
        NSString *name = [NSString stringWithFormat:@"TabBar%d",i + 1];
        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel",i + 1];
        
        [tabBar addTabBarButtonWithName:name selName:selName];
    }
    
    
    
}


// 告诉控制器选中的谁
- (void)tabBar:(ILTabBar *)tabbar didSelectedButtonIndex:(NSInteger)index
{
    
    // 切换选中的控制器
    self.selectedIndex = index;
}




@end
