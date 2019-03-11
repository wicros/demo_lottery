//
//  UIImage+Resizable.m
//  ItheimaLottery
//
//  Created by yz on 14-8-13.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "UIImage+Resizable.h"

@implementation UIImage (Resizable)

+ (instancetype)resizableImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    
    return  [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.width * 0.5];

}

@end
