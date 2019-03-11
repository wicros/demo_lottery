//
//  ILSettingCell.h
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILSettingItem;
@interface ILSettingCell : UITableViewCell

@property (nonatomic, strong) ILSettingItem *item;
@property (nonatomic, strong) NSIndexPath *indexPath;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
