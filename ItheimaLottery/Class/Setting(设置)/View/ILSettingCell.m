//
//  ILSettingCell.m
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILSettingCell.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingLabelItem.h"

@interface ILSettingCell()

// 这里必须用strong，要不然没有强引用，就会被释放，add才会把引用计数器+1，这里没有add，因此得自己强引用他
@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UILabel *labelView;

@property (nonatomic, weak) UIView *divider;

@end

@implementation ILSettingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 1.设置背景
        [self setBg];
        
        // 2.设置子视图
        [self setSubViews];
        
        // 3.添加分割线
        if (!iOS7) {
            
            [self addDivider];
        }
        
    }
    return self;
}
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    // 第0行就隐藏
    _divider.hidden = indexPath.row == 0;
}

- (void)addDivider
{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = [UIColor blackColor];
    divider.alpha = 0.2;
    _divider = divider;
    [self addSubview:divider];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat dividerX = self.textLabel.frame.origin.x;
    CGFloat dividerY = 0;
    CGFloat dividerW = self.bounds.size.width;
    CGFloat dividerH = 1;

    _divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
}

- (void)setFrame:(CGRect)frame
{
    if (!iOS7) {
        
        frame.size.width += 20;
        frame.origin.x -= 10;
    }
    [super setFrame:frame];
}

- (void)setSubViews
{
    // 清空背景颜色
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    // 设置文字大小
    self.textLabel.font = [UIFont systemFontOfSize:15];
    self.detailTextLabel.font = [UIFont systemFontOfSize:13];
    self.detailTextLabel.textColor = [UIColor darkGrayColor];
}

- (void)setBg
{
    // 设置背景颜色
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    
    // 设置选中背景颜色
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = ILColor(237, 233, 218);
    self.selectedBackgroundView = selectedBg;
}

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        UIImageView *arrowV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
        _arrowView = arrowV;
    }
    return _arrowView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

- (UILabel *)labelView
{
    if (_labelView == nil) {
        // label必须设置尺寸才能显示
        _labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        
        // 设置文字颜色
        _labelView.textColor = ILColor(173, 69, 14);
        // 设置字体大小
        _labelView.font = [UIFont systemFontOfSize:13];
        // 设置文字对齐方式
        _labelView.textAlignment = NSTextAlignmentRight;
//        _labelView.text = [NSString stringWithFormat:@"%d",arc4random_uniform(1000000)];
    }
    return _labelView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    
    ILSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[ILSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)setItem:(ILSettingItem *)item
{
    _item = item;
    
    // 1.设置数据
    [self setupData];
    
    // 2.设置辅助视图
    [self setupAccessoryView];
}
- (void)setupAccessoryView
{
    // 右边辅助视图显示箭头还是开关，取决于模型的真实类型
    if ([_item isKindOfClass:[ILSettingArrowItem class]]) { // 箭头
        self.accessoryView = self.arrowView;
        // 设置选中样式
        self.selectionStyle = UITableViewCellSelectionStyleDefault;

    }else if ([_item isKindOfClass:[ILSettingSwitchItem class]]){ // 开关
        self.accessoryView = self.switchView;
        // 不需要选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 设置开关的状态
        ILSettingSwitchItem *item = (ILSettingSwitchItem *)self.item;
        // 一样取反，当是off = NO 表示 开，并且一进来所以开头都是打开的
        self.switchView.on = !item.off;
    }else if ([_item isKindOfClass:[ILSettingLabelItem class]]){ // Label
        self.accessoryView = self.labelView;
        
        // 设置选中样式
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        // 设置值
        ILSettingLabelItem *labelItem = (ILSettingLabelItem *)_item;
        
        self.labelView.text = labelItem.text;

    }else{ // 什么也没有
        self.accessoryView = nil;
        // 设置选中样式
        self.selectionStyle = UITableViewCellSelectionStyleDefault;

    }
    
}
- (void)valueChange:(UISwitch *)switchView
{
    NSLog(@"%@-----%d",self.item.title,switchView.on);
    
    ILSettingSwitchItem *item = (ILSettingSwitchItem *)self.item;
    // 注意这里应该是取反，开表示 off = No
    item.off = !switchView.on;
}

- (void)setupData
{
    self.textLabel.text = _item.title;
    if (_item.icon) {
        
        self.imageView.image = [UIImage imageNamed:_item.icon];
    }
    self.detailTextLabel.text = _item.subTitle;
}

@end
