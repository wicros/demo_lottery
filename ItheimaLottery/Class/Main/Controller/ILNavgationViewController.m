//
//  ILNavgationViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-13.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILNavgationViewController.h"

@interface ILNavgationViewController ()

@end

@implementation ILNavgationViewController

/**
 *  系统会在第一次使用类的时候调用
 */
+ (void)initialize
{
    // 1.获取整个应用下导航栏主题
//    UINavigationBar *nav = [UINavigationBar appearance];
    
    // 获取ILNavgationViewController对象中的导航条
    UINavigationBar *nav = [UINavigationBar appearanceWhenContainedIn:[ILNavgationViewController class], nil];
    
    // 2.设置导航栏背景图片
    UIImage *image = nil;
    
    if (iOS7) {
        image = [UIImage imageNamed:@"NavBar64"];
        // 只有ios7的时候才需要设置导航栏的颜色
        nav.tintColor = [UIColor whiteColor];

    }else{
        image = [UIImage imageNamed:@"NavBar"];
    }
    
    // 设置导航条背景
    [nav setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    // 3.设置导航栏的字体
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [nav setTitleTextAttributes:dictM];
    
    // 4.设置UIBarButtonItem主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemDictM = [NSMutableDictionary dictionary];
    itemDictM[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    itemDictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [item setTitleTextAttributes:itemDictM forState:UIControlStateNormal];
    
    if (!iOS7) {
        
        [item setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

@end
