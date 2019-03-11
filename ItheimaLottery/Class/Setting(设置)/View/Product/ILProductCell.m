//
//  ILProductCell.m
//  ItheimaLottery
//
//  Created by yz on 14-8-15.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILProductCell.h"
#import "ILProduct.h"
@interface ILProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation ILProductCell

- (void)awakeFromNib
{
    self.imageView.layer.cornerRadius = 10;
    self.imageView.clipsToBounds = YES;
}

- (void)setProduct:(ILProduct *)product
{
    _product = product;
    
    _imageView.image =  [UIImage imageNamed:product.icon];
    
    _label.text = product.title;
    
}

@end
