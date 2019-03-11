//
//  ILTitleButton.m
//  ItheimaLottery
//
//  Created by yz on 14-8-13.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#define ILTitleButtonFont [UIFont systemFontOfSize:16]

#import "ILTitleButton.h"

#import <Availability.h>

@implementation ILTitleButton

- (void)awakeFromNib
{
    self.imageView.contentMode = UIViewContentModeCenter;
}

/**
 *  按钮内部的label的frame
 *
 *  @param contentRect 按钮的bounds
 *
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    // 宽度应该按照文字来算
    // size：是限制文字的尺寸，按钮只保持一行的文字，因此我这里就不限制了
    
//    NSDictionary *dict = @{UITextAttributeFont : self.titleLabel.font}; 过期 + 死循环
    NSDictionary *dict = @{NSFontAttributeName : ILTitleButtonFont};
    CGFloat titleW = 0;
    // xcode4 无法通过编译，因为xcode没有boundingRectWithSize这个方法
    if (iOS7) {
//        adsd;
        
// 是xcode5才需要编译
#ifdef __IPHONE_7_0
        titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.width;
      // 如果在xcode4 运行ios7，虽然不会报错，但是也需要计算文字的尺寸，表示如果在xcode4就用sdk6.0的方法
      // iOS7 这个是判断手机的系统，__IPHONE_7_0这个是判断开发工具 一个是编译，一个是运行不要弄混淆了，可以在xcode4 运行ios7的模拟器
#else
       titleW = [self.currentTitle sizeWithFont:ILTitleButtonFont].width;
#endif
    }else{
        
        titleW = [self.currentTitle sizeWithFont:ILTitleButtonFont].width;
        
    }
    
    CGFloat titleH = contentRect.size.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
    
    
}
/**
 *  按钮内部的imageView的frame
 *
 *  @param contentRect 按钮的bounds
 *
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 30;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    CGFloat imageH = contentRect.size.height;
    
    return CGRectMake(imageX, imageY, imageW, imageH);

}

@end
