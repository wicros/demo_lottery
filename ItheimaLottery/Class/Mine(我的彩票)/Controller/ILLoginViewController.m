//
//  ILLoginViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-13.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILLoginViewController.h"
#import "UIImage+Resizable.h"

#import "ILSettingTableViewController.h"

@interface ILLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ILLoginViewController
- (IBAction)setting:(id)sender {
    ILSettingTableViewController *settingVc = [[ILSettingTableViewController alloc] init];
    
    [self.navigationController pushViewController:settingVc animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *normal = [UIImage resizableImage:@"RedButton"];
    
    UIImage *highlight = [UIImage resizableImage:@"RedButtonPressed"];
//    normal resizableImageWithCapInsets:<#(UIEdgeInsets)#>
//    normal resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>
    [_loginBtn setBackgroundImage:normal forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:highlight forState:UIControlStateHighlighted];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
