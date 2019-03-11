//
//  ILHelpViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-16.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILHelpViewController.h"
#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingGroup.h"
#import "ILHtmlViewController.h"

#import "ILNavgationViewController.h"

#import "ILHtml.h"

@interface ILHelpViewController ()
@property (nonatomic, strong) NSArray *htmls;
@end

@implementation ILHelpViewController

- (NSArray *)htmls
{
    if (_htmls == nil) {
        
        // JSON文件路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        // 加载JSON文件
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        // 将JSON转为NSArray
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            ILHtml *p = [ILHtml htmlWithDict:dict];
            [arrM addObject:p];
        }
        _htmls = arrM;
        
        
    }
    return _htmls;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 0组
    [self addGroup0];
}

- (void)addGroup0
{
    
    // 将html模型转换为cell模型。
    
    // 搞个数组保存所有cell模型
    NSMutableArray *arrM = [NSMutableArray array];
    for (ILHtml *html in self.htmls) {
        ILSettingItem *item = [ILSettingArrowItem itemWithIcon:nil title:html.title destVcClass:nil];
        
        [arrM addObject:item];
        
    }
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];

    group0.items = arrM;
    
    [self.dataLists addObject:group0];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ILHtmlViewController *vcHtml = [[ILHtmlViewController alloc] init];
    
    // 取出选中cell对应的模型
    vcHtml.html = _htmls[indexPath.row];
    
    ILNavgationViewController *nav = [[ILNavgationViewController alloc] initWithRootViewController:vcHtml];
    
    [self presentViewController:nav animated:YES completion:nil];
}


@end
