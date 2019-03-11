//
//  ILUnionBuyViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-13.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILUnionBuyViewController.h"
#import "ILTitleButton.h"

@interface ILUnionBuyViewController ()

@end

@implementation ILUnionBuyViewController
- (IBAction)titleBtnClick:(ILTitleButton *)sender {
    
    if (CGAffineTransformEqualToTransform(sender.imageView.transform, CGAffineTransformIdentity)) {
        [UIView animateWithDuration:0.25 animations:^{
            
            sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            
            sender.imageView.transform = CGAffineTransformIdentity;
        }];

    }
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
