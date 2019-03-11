//
//  ILBaseSettingViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-15.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILBaseSettingViewController.h"


#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"


#import "ILSettingCell.h"
#import "ILSettingGroup.h"



@interface ILBaseSettingViewController ()

@end

@implementation ILBaseSettingViewController

- (NSMutableArray *)dataLists
{
    if (_dataLists == nil) {
        _dataLists = [NSMutableArray array];
        
        
    }
    return _dataLists;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    self.tableView.backgroundView = nil;
    

//    NSLog(@"sectionHeaderHeight = %f , sectionFooterHeight = %f",self.tableView.sectionHeaderHeight, self.tableView.sectionFooterHeight);
    self.tableView.sectionHeaderHeight = 18;
    self.tableView.sectionFooterHeight = 0;
    
   
    
    self.tableView.contentInset = UIEdgeInsetsMake(-17, 0, 0, 0);
    
}






- (id)init
{
    // 这里不需要做其他的初始化操作，直接返回就好了
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return self.dataLists.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.dataLists[section] items].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    ILSettingCell *cell = [ILSettingCell cellWithTableView:tableView];
    
    // 设置模型
    ILSettingGroup *group = _dataLists[indexPath.section];
    ILSettingItem *item =  group.items[indexPath.row];
    cell.item = item;
    cell.indexPath = indexPath;

    // 返回cell
    return cell;
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ILSettingGroup *group = _dataLists[section];
    return group.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ILSettingGroup *group = _dataLists[section];
    return group.header;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ILSettingGroup *group = _dataLists[indexPath.section];
    ILSettingItem *item =  group.items[indexPath.row];
    
    // 如果有操作，先执行操作，没有操作执行，才需求判断跳转。
    if (item.option) {
        item.option();
        // 执行完之后，后面就不需要跳转了，操作和跳转不会同时存在
        return;
    }
    
    // 根据模型判断是否需要跳转，
    if ([item isKindOfClass:[ILSettingArrowItem class]]) {
        ILSettingArrowItem *arrowItem = (ILSettingArrowItem *)item;
        
        if (arrowItem.destVcClass) {
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            vc.title = arrowItem.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}

@end
